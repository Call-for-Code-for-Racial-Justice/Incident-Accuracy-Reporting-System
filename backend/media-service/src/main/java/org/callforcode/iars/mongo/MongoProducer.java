package org.callforcode.iars.mongo;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;

// import javax.inject.Inject;

// import org.eclipse.microprofile.config.inject.ConfigProperty;

import com.ibm.websphere.crypto.PasswordUtil;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoDatabase;

@ApplicationScoped
public class MongoProducer {
        String  hostname    = System.getenv("MONGO_HOSTNAME");
        Integer port        = Integer.valueOf( System.getenv("MONGO_PORT") );
        String  dbName      = System.getenv("MONGO_DATABASE");
        String  user        = System.getenv("MONGO_USER");
        String  encodedPass = System.getenv("MONGO_PASS_ENCODED");

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
