package org.callforcode.iars.models;

import java.util.ArrayList;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;

import org.apache.kafka.common.serialization.Serializer;

public class MediaCommitted {
    private static final Jsonb jsonb = JsonbBuilder.create();

    private String incidentNumber;
    private ArrayList<String> files;
    
    public String getIncidentNumber() {
        return incidentNumber;
    }

    public void setIncidentNumber(String value) {
        this.incidentNumber = value;
    }

    public ArrayList<String> getFiles() {
        return files;
    }
    
    public void setFiles(ArrayList<String> value) {
        this.files = new ArrayList<>(value);
    }
    
    public MediaCommitted() {
        
    }

    public static class MediaCommittedSerializer implements Serializer<Object> {
        @Override
        public byte[] serialize(String topic, Object data) {
            return jsonb.toJson(data).getBytes();
        }
    }

}
