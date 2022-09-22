package org.callforcode.iars.application;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.List;
import java.util.Properties;

import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponses;

import com.ibm.websphere.jaxrs20.multipart.IAttachment;

import jakarta.activation.DataHandler;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.UploadObjectArgs;
import io.minio.errors.MinioException;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

@Path("upload")
public class MediaUploadService {
    @POST
    @Consumes("multipart/form-data")
    @APIResponses({
            @APIResponse(responseCode = "200", description = "Successfully inserted media into storage."),
            @APIResponse(responseCode = "500", description = "Problem encountered while processing uploaded media.") })
    @Operation(summary = "Accept array of images and move them into s3 storage.")
    public Response postFormData(List<IAttachment> attachments)
            throws IOException, InvalidKeyException, NoSuchAlgorithmException, IllegalArgumentException {

        MinioClient minioClient = MinioClient.builder()
                .endpoint("http://minio:9000")
                .credentials("iars", "cfc#1234")
                .build();

        for (IAttachment attachment : attachments) {
            if (attachment == null) {
                continue;
            }
            DataHandler dataHandler = attachment.getDataHandler();
            InputStream stream = dataHandler.getInputStream();

            String contentType = dataHandler.getContentType();
            System.out.println("Content-type: " + contentType);
            String fileName = dataHandler.getName();

            if (fileName == null) {
                StringBuilder sb = new StringBuilder();
                BufferedReader br = new BufferedReader(new InputStreamReader(stream));
                String line = null;
                try {
                    while ((line = br.readLine()) != null) {
                        sb.append(line);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    if (br != null) {
                        try {
                            br.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
                System.out.println("Non-file attachment value: " + sb.toString());
            } else {
                File tempFile = new File(fileName);
                OutputStream output = new FileOutputStream(tempFile, false);
                stream.transferTo(output);
                System.out.println("File: " + tempFile.getAbsolutePath());

                // transfer over to object storage
                try {
                    String tmp = null;
                    String bucketName = "iars";
                    boolean found = minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
                    if (!found) {
                        minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
                    } else {
                        tmp = String.format("Bucket %s already exists.", bucketName);
                        System.out.println(tmp);
                    }

                    // Upload file to bucket
                    minioClient.uploadObject(
                            UploadObjectArgs.builder()
                                    .bucket(bucketName)
                                    .object(tempFile.getName())
                                    .filename(tempFile.getAbsolutePath())
                                    .build());
                    tmp = String.format("Successfully added %s to bucket %s", tempFile.getAbsolutePath(),
                            bucketName);
                    System.out.println(tmp);
                } catch (MinioException e) {
                    System.out.println("Error occurred: " + e);
                    System.out.println("HTTP trace: " + e.httpTrace());
                }
            }
            if (stream != null) {
                stream.close();
            }
        }
        return Response.ok("done").build();
    }
}