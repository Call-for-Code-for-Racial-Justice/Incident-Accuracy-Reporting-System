package org.callforcode.iars.dao;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.callforcode.iars.dbModels.Incident;

@ApplicationScoped
public class IncidentDao {

    @PersistenceContext(name = "jpa-unit")
    EntityManager em;

    public void create(Incident incident) {
        em.persist(incident);
    }

    public Incident read(int id) {
        return em.find(Incident.class, id);
    }

    public void update(Incident incident) {
        em.merge(incident);
    }

    public void delete(Incident incident) {
        em.remove(incident);
    }

    public List<Incident> findAll() {
        return em.createNamedQuery("Incident.findAll", Incident.class).getResultList();
    }

    public Incident findByIncidentNumber(String incidentNumber) {
        return em.createNamedQuery("Incident.findByIncidentNumber", Incident.class)
            .setParameter("incidentNumber", incidentNumber).getSingleResult();
    }

    public List<Incident> find(String incidentType, String textLocation) {
        return em.createNamedQuery("Incident.find", Incident.class)
            .setParameter("incidentType", incidentType)
            .setParameter("textLocation", textLocation).getResultList();
    }
}
