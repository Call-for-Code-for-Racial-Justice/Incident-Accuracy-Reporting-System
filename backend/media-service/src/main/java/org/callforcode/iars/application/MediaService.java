package org.callforcode.iars.application;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import org.apache.commons.compress.utils.FileNameUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomStringUtils;

import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponses;

import com.ibm.websphere.jaxrs20.multipart.IAttachment;

import javax.activation.DataHandler;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import org.eclipse.microprofile.config.inject.ConfigProperty;

import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.UploadObjectArgs;
import io.minio.errors.MinioException;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.eclipse.microprofile.reactive.messaging.Incoming;
import org.eclipse.microprofile.reactive.messaging.Message;
import org.eclipse.microprofile.reactive.messaging.Outgoing;
import org.reactivestreams.Publisher;

import io.reactivex.rxjava3.core.BackpressureStrategy;
import io.reactivex.rxjava3.core.Flowable;
import io.reactivex.rxjava3.core.FlowableEmitter;

import org.callforcode.iars.models.Media;
import org.callforcode.iars.models.MediaFile;
import org.callforcode.iars.models.UnprocessedMedia;

@Path("/upload")
@ApplicationScoped
public class MediaService {
    private static Logger logger = Logger.getLogger(MediaService.class.getName());

    private FlowableEmitter<Message<String>> newMediaUploadEmitter;

    String s3Endpoint   = System.getenv("S3_ENDPOINT");
    String s3BucketName = System.getenv("S3_BUCKET");
    String s3AccessKey  = System.getenv("S3_ACCESS_KEY");
    String s3SecretKey  = System.getenv("S3_SECRET_KEY");

    @Inject
    MediaResource mediaManager;

    @POST
    @Consumes("multipart/form-data")
    @APIResponses({
            @APIResponse(responseCode = "200", description = "Successfully inserted media into storage."),
            @APIResponse(responseCode = "500", description = "Problem encountered while processing uploaded media.") })
    @Operation(summary = "Accept array of media files (image or video) then move into s3 storage.")
    public Response postFormData(List<IAttachment> attachments)
            throws IOException, InvalidKeyException, NoSuchAlgorithmException, IllegalArgumentException {

        Date uploadedTimestamp = new Date();
        Media media = new Media();
        List<MediaFile> files = new ArrayList<MediaFile>();

        for (IAttachment attachment : attachments) {
            if (attachment == null) {
                continue;
            }

            DataHandler dataHandler = attachment.getDataHandler();
            InputStream stream = dataHandler.getInputStream();

            String contentType = dataHandler.getContentType();
            logger.info("Content-type: " + contentType);
            String keyName = dataHandler.getName();

            if (keyName.equals("incident_number")) {
                StringBuilder sb = new StringBuilder();
                BufferedReader br = new BufferedReader(new InputStreamReader(stream));
                String line = null;
                try {
                    while ((line = br.readLine()) != null) {
                        sb.append(line);
                    }
                } catch (IOException e) {
                    logger.warning(e.getLocalizedMessage());
                } finally {
                    if (br != null) {
                        try {
                            br.close();
                        } catch (IOException e) {
                            logger.warning(e.getLocalizedMessage());
                        }
                    }
                }
                media.setIncidentNumber(sb.toString());
                logger.info("Non-file attachment value: " + sb.toString());
            } else {
                System.out.println("Adding: " + keyName);
                String fileName = keyName;
                File tmpFile = new File(fileName);
                OutputStream output = new FileOutputStream(tmpFile, false);
                stream.transferTo(output);

                MediaFile mf = new MediaFile();
                mf.setName(fileName);
                mf.setSize(FileUtils.sizeOf(tmpFile));
                mf.setCreated(new Date(tmpFile.lastModified()));
                mf.setUploaded(uploadedTimestamp);
                files.add(mf);
            }
            if (stream != null) {
                stream.close();
            }
        }

        if (media.getIncidentNumber().isEmpty()) {
            logger.warning("Missing incident_number.");
            return Response
                    .status(Response.Status.BAD_REQUEST)
                    .entity("The 'incident_number' parameter is missing.")
                    .build();
        }

        // transfer to object storage and mongodb
        try {
            String tmp = null;

            // init object storage client
            MinioClient minioClient = MinioClient.builder()
                    .endpoint(s3Endpoint)
                    .credentials(
                            s3AccessKey, s3SecretKey)
                    .build();
            boolean found = minioClient.bucketExists(BucketExistsArgs.builder().bucket(s3BucketName).build());
            if (!found) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(s3BucketName).build());
            } else {
                tmp = String.format("Bucket %s already exists.", s3BucketName);
                logger.info(tmp);
            }

            // init mongodb client

            // loops through files
            for (MediaFile mf : files) {
                File tmpFile = new File(mf.getName());

                // transform filename
                String osFileName = media.getIncidentNumber() + "-" + RandomStringUtils.randomAlphanumeric(6) + "."
                        + FileNameUtils.getExtension(tmpFile.getName());
                mf.setName(osFileName);

                // Upload file to bucket
                minioClient.uploadObject(
                        UploadObjectArgs.builder()
                                .bucket(s3BucketName)
                                .object(mf.getName())
                                .filename(tmpFile.getAbsolutePath())
                                .build());
                tmp = String.format("Successfully added %s to bucket %s", tmpFile.getAbsolutePath(),
                        s3BucketName);
                logger.info(tmp);
            }

            media.setFiles(files);
        } catch (MinioException e) {
            logger.warning("Error occurred: " + e.getLocalizedMessage());
            logger.warning("HTTP trace: " + e.httpTrace());
        }

        String mediaStr = media.toString();
        System.out.println("MEDIA OBJECT: " + mediaStr);
        Message<String> message = Message.of(mediaStr);
        newMediaUploadEmitter.onNext(message);

        if (!media.getIncidentNumber().isEmpty() && media.getFiles() != null) {
            mediaManager.add(media);
        }

        return Response.ok("done").build();
    }

    @Incoming("mediaCommittedToIncident")
    public void processNewMedia(UnprocessedMedia um) {
        logger.info("processNewMedia: " + um);
        String incidentNumber = um.getIncidentNumber();

        Media media = mediaManager.lookup(incidentNumber);
        if (media != null && media.getFiles().size() == um.getFiles().size()) {
            logger.info(media.toString());
            mediaManager.remove(incidentNumber);
        } else {
            logger.warning("Problem locating incident: " + incidentNumber);
        }

        // do something with the data
    }

    @Outgoing("newMediaUpload")
    public Publisher<Message<String>> sendPropertyName() {
        Flowable<Message<String>> flowable = Flowable.create(emitter -> this.newMediaUploadEmitter = emitter,
                BackpressureStrategy.BUFFER);
        return flowable;
    }
}