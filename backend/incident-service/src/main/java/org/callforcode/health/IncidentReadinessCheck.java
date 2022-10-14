package org.callforcode.health;

import java.util.Collection;
import java.util.Properties;
import java.util.logging.Logger;

import org.apache.kafka.clients.admin.AdminClient;
import org.apache.kafka.clients.admin.ListTopicsResult;
import org.apache.kafka.clients.admin.TopicListing;
import org.apache.kafka.common.KafkaFuture;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.Readiness;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

@Readiness
@ApplicationScoped
public class IncidentReadinessCheck implements HealthCheck {
    private static Logger logger = Logger.getLogger(IncidentReadinessCheck.class.getName());
    
    @Inject
    @ConfigProperty(name = "mp.messaging.connector.liberty-kafka.bootstrap.servers")
    String kafkaServer;
    
    @Inject
    @ConfigProperty(name = "mp.messaging.incoming.NewMediaUpload.group.id")
    String groupId;
    
    @Override
    public HealthCheckResponse call() {
        boolean up = isReady();
        return HealthCheckResponse.named(this.getClass().getSimpleName()).state(up).build();
    }

    private boolean isReady() {
        AdminClient adminClient = createAdminClient();
        return checkIfBarConsumerGroupRegistered(adminClient);
    }
    
    private AdminClient createAdminClient() {
        Properties connectionProperties = new Properties();
        connectionProperties.put("bootstrap.servers", kafkaServer);
        AdminClient adminClient = AdminClient.create(connectionProperties);
        return adminClient;
    }
    
    private boolean checkIfBarConsumerGroupRegistered(AdminClient adminClient) {
        ListTopicsResult topics = adminClient.listTopics();
        KafkaFuture<Collection<TopicListing>> topicsFuture = topics.listings();
        try {
            Collection<TopicListing> topicList = topicsFuture.get();
            for (TopicListing t : topicList)
                logger.info("topic: " + t.name());
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
