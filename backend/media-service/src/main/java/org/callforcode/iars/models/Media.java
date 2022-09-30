package org.callforcode.iars.models;

import java.util.List;
import java.util.Objects;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;

import javax.validation.constraints.NotEmpty;

import org.apache.kafka.common.serialization.Deserializer;
import org.apache.kafka.common.serialization.Serializer;

// tag::Media[]
public class Media {
    private static final Jsonb jsonb = JsonbBuilder.create();

    @NotEmpty(message = "Incident number must be present!")
    private String incidentNumber;

    @NotEmpty(message = "File list must be present!")
    private List<MediaFile> files;

    public String getIncidentNumber() {
        return incidentNumber;
    }

    public void setIncidentNumber(String incidentNumber) {
        this.incidentNumber = incidentNumber;
    }

    public List<MediaFile> getFiles() {
        return files;
    }

    public void setFiles(List<MediaFile> files) {
        this.files = List.copyOf(files);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (!(o instanceof Media))
            return false;
        Media m = (Media) o;
        return Objects.equals(incidentNumber, m.incidentNumber)
                && Objects.equals(files, m.files);
    }

    @Override
    public int hashCode() {
        return Objects.hash(incidentNumber, files);
    }

    @Override
    public String toString() {
        return "Media: " + jsonb.toJson(this);
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
// end::Media[]