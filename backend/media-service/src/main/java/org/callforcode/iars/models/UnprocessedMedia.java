package org.callforcode.iars.models;

import java.util.List;
import java.util.Objects;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;

import javax.validation.constraints.NotEmpty;

import org.apache.kafka.common.serialization.Deserializer;
import org.apache.kafka.common.serialization.Serializer;

public class UnprocessedMedia {
    private static final Jsonb jsonb = JsonbBuilder.create();

    @NotEmpty(message = "Incident number must be present!")
    private String incidentNumber;

    @NotEmpty(message = "File list must be present!")
    private List<String> files;

    public String getIncidentNumber() {
        return incidentNumber;
    }

    public void setIncidentNumber(String incidentNumber) {
        this.incidentNumber = incidentNumber;
    }

    public List<String> getFiles() {
        return files;
    }

    public void setFiles(List<String> files) {
        this.files = List.copyOf(files);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (!(o instanceof Media))
            return false;
        UnprocessedMedia m = (UnprocessedMedia) o;
        return Objects.equals(incidentNumber, m.incidentNumber)
                && Objects.equals(files, m.files);
    }

    @Override
    public int hashCode() {
        return Objects.hash(incidentNumber, files);
    }

    @Override
    public String toString() {
        return "UnprocessedMedia: " + jsonb.toJson(this);
    }

    public static class UnprocessedMediaSerializer implements Serializer<Object> {
        @Override
        public byte[] serialize(String topic, Object data) {
            return jsonb.toJson(data).getBytes();
        }
    }

    public static class UnprocessedMediaDeserializer implements Deserializer<UnprocessedMedia> {
        @Override
        public UnprocessedMedia deserialize(String topic, byte[] data) {
            if (data == null)
                return null;
            return jsonb.fromJson(new String(data), UnprocessedMedia.class);
        }
    }
}