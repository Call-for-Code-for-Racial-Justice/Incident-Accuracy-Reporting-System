FROM maven:3.8.6-openjdk-11-slim AS BUILD

COPY pom.xml /usr/src/app/
COPY src /usr/src/app/src
RUN mvn -f /usr/src/app/pom.xml package clean

EXPOSE 9080

CMD ["mvn", "-f", "/usr/src/app/pom.xml", "liberty:dev"]