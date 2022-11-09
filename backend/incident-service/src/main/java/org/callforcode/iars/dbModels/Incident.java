package org.callforcode.iars.dbModels;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

// import javax.json.bind.Jsonb;
// import javax.json.bind.JsonbBuilder;

// import org.apache.kafka.common.serialization.Deserializer;
// import org.apache.kafka.common.serialization.Serializer;

@Entity
@Table(name = "Incident")
@NamedQuery(name = "Incident.findAll", query = "SELECT i FROM Incident i")
@NamedQuery(name = "Incident.find", query = "SELECT i FROM Incident i WHERE i.incidentType = :incidentType AND i.textLocation = :textLocation")
@NamedQuery(name = "Incident.findByIncidentNumber", query = "SELECT i FROM Incident i WHERE i.incidentNumber = :incidentNumber")
public class Incident implements Serializable {

    private static final long serialVersionUID = 1L;
    //private static final Jsonb jsonb = JsonbBuilder.create();

    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "incidentType")
    private String incidentType;

    @Column(name = "incidentNumber")
    private String incidentNumber;

    @NotNull
    @Column(name = "isLive")
    private boolean isLive;

    @NotNull
    @Column(name = "isDraft")
    private boolean isDraft;

    @Column(name = "textLocation")
    private String textLocation;

    @Column(name = "latitude")
    private float latitude;

    @Column(name = "longitude")
    private float longitude;

    @Column(name = "viewpoint")
    private String viewpoint;

    @Column(name = "description")
    private String description;

    @Column(name = "reportedDate")
    private Date reportedDate;

    @OneToMany(mappedBy = "incident", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private Set<IncidentMedia> incidentMedia;
    
    public int getId() {
        return id;
    }

    public void setId(int value) {
        this.id = value;
    }

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

    public ArrayList<IncidentMedia> getIncidentMedia() {
        return new ArrayList<>(incidentMedia);
    }

    public void setIncidentMedia(ArrayList<IncidentMedia> value) {
        this.incidentMedia = new HashSet<>(value);
    }

    public Date getReportedDate() {
        return reportedDate;
    }

    public void setReportedDate(Date value) {
        this.reportedDate = value;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float f) {
        this.latitude = f;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float f) {
        this.longitude = f;
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

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + id;
        result = prime * result + ((textLocation == null) ? 0 : textLocation.hashCode());
        result = prime * result + ((incidentType == null) ? 0 : incidentType.hashCode());
        result = prime * result + ((viewpoint == null) ? 0 : viewpoint.hashCode());
        result = prime * result + ((description == null) ? 0 : description.hashCode());
        result = prime * result + (int)(serialVersionUID ^ (serialVersionUID >>> 32));

        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (obj == null) {
            return false;
        }

        if (getClass() != obj.getClass()) {
            return false;
        }

        Incident other = (Incident) obj;

        if (incidentType == null) {
            if (other.incidentType != null) {
                return false;
            }
        }
        else if (!incidentType.equals(other.incidentType)) {
            return false;
        }

        if (textLocation == null) {
            if (other.textLocation != null) {
                return false;
            }
        }
        else if (!textLocation.equals(other.textLocation)) {
            return false;
        }

        if (viewpoint == null) {
            if (other.viewpoint != null) {
                return false;
            }
        }
        else if (!viewpoint.equals(other.viewpoint)) {
            return false;
        }

        return true;
    }

    @Override
    public String toString() {
        return "Incident [id=" + id + ", incidentType=" + incidentType + ", textLocation=" + textLocation + "]";
        //return jsonb.toJson(this);
    }

    // public static class IncidentSerializer implements Serializer<Object> {
    //     @Override
    //     public byte[] serialize(String topic, Object data) {
    //         return jsonb.toJson(data).getBytes();
    //     }
    // }

    // public static class IncidentDeserializer implements Deserializer<Incident> {
    //     @Override
    //     public Incident deserialize(String topic, byte[] data) {
    //         if (data == null)
    //             return null;
    //         return jsonb.fromJson(new String(data), Incident.class);
    //     }
    // }
}
