package org.callforcode.iars.dao;

import java.util.List;

import org.callforcode.iars.models.Incident;

import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@RequestScoped
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

    public List<Incident> find(String incidentType, String location) {
        return em.createNamedQuery("Incident.find", Incident.class)
            .setParameter("incidentType", incidentType)
            .setParameter("location", location).getResultList();
    }
}
