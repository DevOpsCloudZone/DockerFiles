FROM maven:3.9.11-eclipse-temurin-17 AS dependencies
MAINTAINER umesh
LABEL  Java Application using Multi-Stage-Docker= "true"
WORKDIR /app
COPY pom.xml ./
RUN mvn dependency:go-offline


FROM dependencies AS builder
COPY src ./src
RUN mvn package


FROM eclipse-temurin:17-jre  AS Final
WORKDIR /app
COPY --from=builder /app/target/java-app-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
