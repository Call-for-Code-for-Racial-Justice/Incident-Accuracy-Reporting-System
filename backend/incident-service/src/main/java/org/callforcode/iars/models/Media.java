package org.callforcode.iars.models;

import java.util.ArrayList;
import java.util.List;

import org.apache.kafka.common.serialization.Deserializer;
import org.apache.kafka.common.serialization.Serializer;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;

public class Media {

    private static final Jsonb jsonb = JsonbBuilder.create();

    public String incidentNumber;
    public List<MediaFile> files;

    public Media() {
        
    }

    public Media(String incidentId, ArrayList<MediaFile> files) {
        this.incidentNumber = incidentId;

        List<MediaFile> incomingFiles = new ArrayList<>();

        for (var file : files) {
            incomingFiles.add(file);
        }

        this.files = incomingFiles;
    }

    public static class MediaSerializer implements Serializer<Object> {
        @Override
        public byte[] serialize(String topic, Object data) {
            return jsonb.toJson(data).getBytes();
        }
    }

    public static class MediaDeserializer implements Deserializer<Media> {
        @Override
        public Media deserialize(String topic, byte[] data) {
            if (data == null)
                return null;
            return jsonb.fromJson(new String(data), Media.class);
        }
    }
    
}
