package org.callforcode.iars.application;

import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import javax.validation.Validator;
import javax.validation.ConstraintViolation;
import javax.validation.ValidationException;

import org.bson.Document;

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

@ApplicationScoped
public class MediaManager {
    private static Logger logger = Logger.getLogger(MediaManager.class.getName());

    @Inject
    MongoDatabase db;

    @Inject
    Validator validator;

    private JsonArray getViolations(Media media) {
        Set<ConstraintViolation<Media>> violations = validator.validate(media);

        JsonArrayBuilder messages = Json.createArrayBuilder();

        for (ConstraintViolation<Media> v : violations) {
            messages.add(v.getMessage());
        }

        return messages.build();
    }

    public boolean add(Media media) {
        JsonArray violations = getViolations(media);

        if (!violations.isEmpty()) {
            logger.warning("MediaManager::add -> " + violations.toString());
            return false;
        }

        MongoCollection<Document> unprocessedMediaCollection = db.getCollection("Media");

        Document newMedia = new Document();
        newMedia.put("IncidentNumber", media.getIncidentNumber());
        newMedia.put("Files", media.getFiles());

        unprocessedMediaCollection.insertOne(newMedia);

        return true;
    }

    public UnprocessedMedia lookup(String incidentNumber) {
        UnprocessedMedia um = new UnprocessedMedia();
        um.setIncidentNumber(incidentNumber);
        try {
            MongoCollection<Document> unprocessedMediaCollection = db.getCollection("Media");

            BasicDBObject query = new BasicDBObject();
            query.put("incidentNumber", incidentNumber);
            FindIterable<Document> docs = unprocessedMediaCollection.find(query);
            for (Document d : docs) {
                if (d.getString("IncidentNumber").equals(incidentNumber)) {
                    List<String> files = d.getList("Files", String.class);
                    um.setFiles(files);
                    break;
                }
            }
        } catch (Exception e) {
            logger.warning(e.getLocalizedMessage());
            return null;
        }

        return um;
    }

    public boolean remove(String id) {
        MongoCollection<Document> unprocessedMediaCollection = db.getCollection("Media");

        Document query = new Document("_id", id);
        DeleteResult deleteResult = unprocessedMediaCollection.deleteOne(query);
        if (deleteResult.getDeletedCount() == 0) {
            logger.warning("MediaManager::remove -> " + id + " was not found.");
            return false;
        }

        return true;
    }
}
