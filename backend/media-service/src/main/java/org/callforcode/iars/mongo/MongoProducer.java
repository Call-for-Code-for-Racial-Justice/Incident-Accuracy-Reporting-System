package org.callforcode.iars.mongo;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;

import javax.inject.Inject;
import javax.net.ssl.SSLContext;

import com.ibm.websphere.ssl.JSSEHelper;
import com.ibm.websphere.ssl.SSLException;

import org.eclipse.microprofile.config.inject.ConfigProperty;

import com.ibm.websphere.crypto.PasswordUtil;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoDatabase;

import java.util.Collections;

@ApplicationScoped
public class MongoProducer {
    @Inject
    @ConfigProperty(name = "mongo.hostname", defaultValue = "localhost")
    String hostname;

    @Inject
    @ConfigProperty(name = "mongo.port", defaultValue = "27017")
    int port;

    @Inject
    @ConfigProperty(name = "mongo.dbname", defaultValue = "iars-media")
    String dbName;

    @Inject
    @ConfigProperty(name = "mongo.user")
    String user;

    @Inject
    @ConfigProperty(name = "mongo.pass.encoded")
    String encodedPass;

    @Produces
    public MongoClient createMongo() throws SSLException {
        String password = PasswordUtil.passwordDecode(encodedPass);
        MongoCredential creds = MongoCredential.createCredential(
                user,
                dbName,
                password.toCharArray());

        SSLContext sslContext = JSSEHelper.getInstance().getSSLContext(
                "outboundSSLContext",
                Collections.emptyMap(),
                null);

        return new MongoClient(
                new ServerAddress(hostname, port),
                creds,
                new MongoClientOptions.Builder()
                        .sslEnabled(true)
                        .sslContext(sslContext)
                        .build());
    }

    @Produces
    public MongoDatabase createDB(
            MongoClient client) {
        return client.getDatabase(dbName);
    }

    public void close(
            @Disposes MongoClient toClose) {
        toClose.close();
    }
}
