package org.callforcode.iars.mongo;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;

import javax.inject.Inject;

import org.eclipse.microprofile.config.inject.ConfigProperty;

import com.ibm.websphere.crypto.PasswordUtil;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoDatabase;

@ApplicationScoped
public class MongoProducer {
        @Inject
        @ConfigProperty(name = "mongo.hostname", defaultValue = "localhost")
        String hostname;

        @Inject
        @ConfigProperty(name = "mongo.port", defaultValue = "27017")
        int port;

        @Inject
        @ConfigProperty(name = "mongo.dbname", defaultValue = "media")
        String dbName;

        @Inject
        @ConfigProperty(name = "mongo.user")
        String user;

        @Inject
        @ConfigProperty(name = "mongo.pass.encoded")
        String encodedPass;

        @Produces
        public MongoClient createMongo() {
                String password = PasswordUtil.passwordDecode(encodedPass);
                MongoCredential creds = MongoCredential.createCredential(
                                user,
                                dbName,
                                password.toCharArray());

                // SSLContext sslContext = JSSEHelper.getInstance().getSSLContext(
                // "outboundSSLContext",
                // Collections.emptyMap(),
                // null);

                return new MongoClient(
                                new ServerAddress(hostname, port),
                                creds,
                                new MongoClientOptions.Builder().build());
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
