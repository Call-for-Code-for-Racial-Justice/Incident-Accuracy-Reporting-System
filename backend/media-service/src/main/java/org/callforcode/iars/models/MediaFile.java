package org.callforcode.iars.models;

import java.util.Date;
import java.util.Objects;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;

import javax.validation.constraints.NotEmpty;

import org.apache.kafka.common.serialization.Deserializer;
import org.apache.kafka.common.serialization.Serializer;

import com.mongodb.BasicDBObject;

public class MediaFile {
    private static final Jsonb jsonb = JsonbBuilder.create();

    @NotEmpty(message = "All media files must have a name!")
    private String name;

    @NotEmpty(message = "Size must be a non-negative integer!")
    private Long size;

    @NotEmpty(message = "Created must be a date!")
    private Date created;

    @NotEmpty(message = "Uploaded must be a date!")
    private Date uploaded;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUploaded() {
        return uploaded;
    }

    public void setUploaded(Date uploaded) {
        this.uploaded = uploaded;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (!(o instanceof MediaFile))
            return false;
        MediaFile mf = (MediaFile) o;
        return Objects.equals(
                name, mf.name)
                && Objects.equals(size, mf.size)
                && Objects.equals(created, mf.created)
                && Objects.equals(uploaded, mf.uploaded);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, size, created, uploaded);
    }

    @Override
    public String toString() {
        return "MediaFile: " + jsonb.toJson(this);
    }

    public BasicDBObject toBasicDBObject() {
        BasicDBObject b = new BasicDBObject();
        b.put("name", this.name);
        b.put("size", this.size);
        b.put("created", this.created);
        b.put("uploaded", this.uploaded);
        return b;
    }

    public static class MediaFileSerializer implements Serializer<Object> {
        @Override
        public byte[] serialize(String topic, Object data) {
            return jsonb.toJson(data).getBytes();
        }
    }

    public static class MediaFileDeserializer implements Deserializer<MediaFile> {
        @Override
        public MediaFile deserialize(String topic, byte[] data) {
            if (data == null)
                return null;
            return jsonb.fromJson(new String(data), MediaFile.class);
        }
    }
}