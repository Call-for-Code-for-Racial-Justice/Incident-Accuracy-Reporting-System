package org.callforcode.iars.models;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;

public class MediaFile {
    private static final Jsonb jsonb = JsonbBuilder.create();

    public long size;
    public long uploaded;
    public String filename;

    public MediaFile() {
        
    }

    public MediaFile(long size, long uploaded, String filename) {
        this.size = size;
        this.uploaded = uploaded;
        this.filename = filename;
    }
}
