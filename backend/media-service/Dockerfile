FROM maven:3.8.6-openjdk-11-slim AS BUILD

COPY src /usr/src/app/src
COPY pom.xml /usr/src/app/
RUN mvn -f /usr/src/app/pom.xml clean package

FROM open-liberty:22.0.0.9-full-java11-openj9

COPY src/main/liberty/config/server.xml /config/
COPY --from=BUILD /usr/src/app/target/media-service.war /config/apps/

RUN configure.sh
EXPOSE 9080