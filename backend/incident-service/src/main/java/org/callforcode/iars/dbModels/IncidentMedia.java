package org.callforcode.iars.dbModels;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "IncidentMedia")
public class IncidentMedia implements Serializable {
    private static final long serialVersionUID = 1L;

    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "incidentId")
    private Incident incident;

    @NotNull
    @Column(name = "filename")
    private String filename;

    @NotNull
    @Column(name = "size")
    private long size;

    @NotNull
    @Column(name = "uploaded")
    private Date uploaded;

    @NotNull
    @Column(name = "created")
    private Date created;
    
    public int getId() {
        return id;
    }

    public void setId(int value) {
        this.id = value;        
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String value) {
        this.filename = value;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long value) {
        this.size = value;
    }

    public Date getUploaded() {
        return uploaded;
    }

    public void setUploaded(Date value) {
        this.uploaded = value;
    }

    public Incident getIncident() {
        return incident;
    }

    public void setIncident(Incident value) {
        this.incident = value;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date value) {
        this.created = value;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + id;
        result = prime * result + ((filename == null) ? 0 : filename.hashCode());
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

        IncidentMedia other = (IncidentMedia) obj;

        if (filename == null) {
            if (other.filename != null) {
                return false;
            }
        }
        else if (!filename.equals(other.filename)) {
            return false;
        }

        if (size != other.size) {
            return false;
        }

        if (!uploaded.equals(other.uploaded)) {
            return false;
        }

        return true;
    }

    @Override
    public String toString() {
        return "IncidentMedia [id=" + id + ", filename=" + filename + ", size=" + size + ", uploaded=" + uploaded.toString() + "]";
    }
}
