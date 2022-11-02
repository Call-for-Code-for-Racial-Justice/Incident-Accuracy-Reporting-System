package org.callforcode.iars.application;

import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.callforcode.iars.dao.IncidentDao;
import org.callforcode.iars.dbModels.Incident;
import org.callforcode.iars.dbModels.IncidentMedia;
import org.callforcode.iars.models.IncidentGps;
import org.callforcode.iars.models.Media;
import org.callforcode.iars.models.MediaCommitted;
import org.callforcode.iars.models.NewIncident;
import org.eclipse.microprofile.reactive.messaging.Acknowledgment;
import org.eclipse.microprofile.reactive.messaging.Incoming;
import org.eclipse.microprofile.reactive.messaging.Message;
import org.eclipse.microprofile.reactive.messaging.Outgoing;
import org.eclipse.microprofile.reactive.streams.operators.PublisherBuilder;
import org.eclipse.microprofile.reactive.streams.operators.ReactiveStreams;

import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Logger;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@ApplicationScoped
@Path("/")
public class IncidentService {
    private static Logger logger = Logger.getLogger(IncidentService.class.getName());

    @Inject
    private IncidentDao dao;

    @POST
    @Path("/report")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Transactional
    public Response createIncident(NewIncident newIncident) {
        Incident incident = new Incident();
        incident.setIncidentNumber(newIncident.getIncidentNumber());
        incident.setIncidentType(newIncident.getIncidentType());
        incident.setIsLive(newIncident.getIsLive());
        incident.setIsDraft(newIncident.getIsDraft());
        incident.setTextLocation(newIncident.getTextLocation());
        incident.setViewpoint(newIncident.getViewpoint());
        incident.setDescription(newIncident.getDescription());
        // timestamp comes in as seconds, need to convert to milliseconds
        incident.setReportedDate(new Date(newIncident.getTimestamp() * 1000));

        IncidentGps gps = newIncident.getGps();
        if (gps != null) {
            incident.setLatitude(gps.getLatitude());
            incident.setLongitude(gps.getLongitude());
        }

        System.out.println("Incident: " + incident.toString());

        try {
            dao.create(incident);
            return Response.status(Response.Status.CREATED).entity(incident).build();
        } catch (Exception ex) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
        }
    }

    @Incoming("NewMediaUpload")
    @Outgoing("MediaCommittedToIncident")
    @Acknowledgment(Acknowledgment.Strategy.MANUAL)
    @Transactional
    public PublisherBuilder<Message<MediaCommitted>> uploadedMedia(Message<Media> m) throws Exception
    {
        Media media = m.getPayload();
        m.ack();

        Incident i = dao.findByIncidentNumber(media.incidentNumber);
        
        if (i == null) {
            logger.warning("Incident " + media.incidentNumber + " not found!");
            return ReactiveStreams.empty();
        } else {
            ArrayList<IncidentMedia> incidentMedia = new ArrayList<>();
            for (var file : media.files) {
                IncidentMedia im = new IncidentMedia();
                
                im.setFilename(file.filename);
                im.setSize(file.size);
                im.setUploaded(new Date(file.uploadedTimestamp * 1000));
                im.setCreated(new Date(file.createdTimestamp * 1000));
                im.setIncident(i);
                
                incidentMedia.add(im);
                logger.info("Adding file " + file.filename + " to Incident " + i.getIncidentNumber());
            }

            i.setIncidentMedia(incidentMedia);

            try {
                dao.update(i);

                MediaCommitted mc = new MediaCommitted();
                mc.setIncidentNumber(media.incidentNumber);

                ArrayList<String> list = new ArrayList<>();
                for (var file : i.getIncidentMedia()) {
                    list.add(file.getFilename());
                }

                mc.setFiles(list);

                logger.info("Incident " + media.incidentNumber + " information successfully transmitted to MediaCommittedToIncident");
                return ReactiveStreams.of(Message.of(mc));
            } catch (Exception ex) {
                logger.warning("Error updating Incident " + media.incidentNumber + ": " + ex.getLocalizedMessage());
                return ReactiveStreams.empty();
            }
        }
    }
}
