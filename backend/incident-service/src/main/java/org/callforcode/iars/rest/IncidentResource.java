package org.callforcode.iars.rest;

import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;

import org.callforcode.iars.dao.IncidentDao;
import org.callforcode.iars.models.Incident;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@RequestScoped
@Path("incidents")
public class IncidentResource {

    @Inject
    private IncidentDao dao;

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Transactional
    public Response createIncident(Incident incident) {
        String response = "ID: " + incident.getId();

        if (!dao.find(incident.getIncidentType(), incident.getLocation()).isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Incident already exists").build();
        }

        dao.create(incident);

        return Response.status(Response.Status.CREATED).entity(response).build();
    }
}
