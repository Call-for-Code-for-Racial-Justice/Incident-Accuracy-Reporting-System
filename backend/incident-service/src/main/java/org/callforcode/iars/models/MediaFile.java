package org.callforcode.iars.models;

public class MediaFile {
    public long size;
    public long uploadedTimestamp;
    public String uploadedDate;
    public long createdTimestamp;
    public String createdDate;
    public String filename;

    public MediaFile() {
        
    }

    public MediaFile(long size, long uploadedTimestamp, String filename,
        long createdTimestamp, String createdDate, String uploadedDate) {
        this.size = size;
        this.uploadedTimestamp = uploadedTimestamp;
        this.createdTimestamp = createdTimestamp;
        this.filename = filename;
        this.uploadedDate = uploadedDate;
        this.createdDate = createdDate;
    }
}
