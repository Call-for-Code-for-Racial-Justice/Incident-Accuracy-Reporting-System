package org.callforcode.iars.application;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import javax.validation.Validator;
import javax.validation.ConstraintViolation;

import org.bson.Document;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.DeleteResult;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.Json;

import org.callforcode.iars.models.UnprocessedMedia;
import org.callforcode.iars.models.Media;
import org.callforcode.iars.models.MediaFile;

@ApplicationScoped
public class MediaResource {
    private static Logger logger = Logger.getLogger(MediaResource.class.getName());

    @Inject
    MongoDatabase db;

    @Inject
    Validator validator;

    private JsonArray getViolations(Media media) {
        if (validator == null)
            return null;

        Set<ConstraintViolation<Media>> violations = validator.validate(media);

        JsonArrayBuilder messages = Json.createArrayBuilder();

        for (ConstraintViolation<Media> v : violations) {
            messages.add(v.getMessage());
        }

        return messages.build();
    }

    public boolean add(Media media) {
        JsonArray violations = getViolations(media);

        if (violations != null && !violations.isEmpty()) {
            logger.warning("MediaManager::add -> " + violations.toString());
            return false;
        }

        MongoCollection<Document> unprocessedMediaCollection = null;
        if (db != null) {
            unprocessedMediaCollection = db.getCollection("media");
        } else {
            System.out.println("The 'db' object is not defined.");
            return false;
        }

        Document newMedia = new Document();
        newMedia.put("IncidentNumber", media.getIncidentNumber());
        List<BasicDBObject> files = new ArrayList<>();
        for (MediaFile mf : media.getFiles()) {
            files.add(mf.toBasicDBObject());
        }
        newMedia.put("Files", files);

        unprocessedMediaCollection.insertOne(newMedia);

        return true;
    }

    public Media lookup(String incidentNumber) {
        Media media = new Media();
        media.setIncidentNumber(incidentNumber);

        try {
            MongoCollection<Document> unprocessedMediaCollection = db.getCollection("media");

            BasicDBObject query = new BasicDBObject();
            query.put("IncidentNumber", incidentNumber);
            FindIterable<Document> docs = unprocessedMediaCollection.find(query);
            for (Document doc : docs) {
                if (doc.getString("IncidentNumber").equals(incidentNumber)) {
                    List<MediaFile> files = new ArrayList<MediaFile>();

                    List<Document> fileList = doc.getList("Files", Document.class);
                    for (Document file : fileList) {
                        MediaFile mf = new MediaFile();
                        mf.setName(file.getString("name"));
                        mf.setSize(file.getLong("size"));
                        mf.setCreated(file.getDate("createdDate"));
                        mf.setUploaded(file.getDate("uploadedDate"));

                        System.out.println(mf);

                        files.add(mf);
                    }

                    media.setFiles(files);
                    break;
                }
            }
        } catch (Exception e) {
            logger.warning(e.getLocalizedMessage());
            return null;
        }

        return media;
    }

    public boolean remove(String incidentNumber) {
        MongoCollection<Document> unprocessedMediaCollection = db.getCollection("media");

        Document query = new Document("IncidentNumber", incidentNumber);
        DeleteResult deleteResult = unprocessedMediaCollection.deleteOne(query);
        if (deleteResult.getDeletedCount() == 0) {
            logger.warning("MediaManager::remove -> " + incidentNumber + " was not found.");
            return false;
        }

        return true;
    }
}
