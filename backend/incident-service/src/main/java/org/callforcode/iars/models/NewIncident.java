package org.callforcode.iars.models;

public class NewIncident {
    private String incidentType;
    private String incidentNumber;
    private boolean isLive;
    private boolean isDraft;
    private String textLocation;
    private IncidentGps gps;
    private String viewpoint;
    private String description;
    private long timestamp;

    public String getIncidentType() {
        return incidentType;
    }

    public void setIncidentType(String value) {
        this.incidentType = value;
    }

    public String getTextLocation() {
        return textLocation;
    }

    public void setTextLocation(String value) {
        this.textLocation = value;
    }

    public String getIncidentNumber() {
        return this.incidentNumber;
    }

    public void setIncidentNumber(String value) {
        this.incidentNumber = value;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long value) {
        this.timestamp = value;
    }

    public IncidentGps getGps() {
        return gps;
    }

    public void setGps(IncidentGps value) {
        this.gps = value;
    }

    public boolean getIsLive() {
        return isLive;
    }

    public void setIsLive(boolean value) {
        this.isLive = value;
    }

    public boolean getIsDraft() {
        return isDraft;
    }

    public void setIsDraft(boolean value) {
        this.isDraft = value;
    }

    public String getViewpoint() {
        return this.viewpoint;
    }

    public void setViewpoint(String value) {
        this.viewpoint = value;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String value) {
        this.description = value;
    }

    public NewIncident() {
        
    }
}