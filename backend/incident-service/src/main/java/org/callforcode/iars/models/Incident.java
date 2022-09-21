package org.callforcode.iars.models;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "Incident")
@NamedQuery(name = "Incident.findAll", query = "SELECT i FROM Incident i")
@NamedQuery(name = "Incident.find", query = "SELECT i FROM Incident i WHERE i.incidentType = :incidentType AND i.location = :location")
public class Incident implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "incidentType")
    private String incidentType;

    @Column(name = "location")
    private String location;

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

    public String getLocation() {
        return location;
    }

    public void setLocation(String value) {
        this.location = value;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + id;
        result = prime * result + ((location == null) ? 0 : location.hashCode());
        result = prime * result + ((incidentType == null) ? 0 : incidentType.hashCode());
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

        if (location == null) {
            if (other.location != null) {
                return false;
            }
        }
        else if (!location.equals(other.location)) {
            return false;
        }

        return true;
    }

    @Override
    public String toString() {
        return "Incident [id=" + id + ", incidentType=" + incidentType + ", location=" + location + "]";
    }
}
