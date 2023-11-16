# Build Stage
FROM maven:3.8.3-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package -DskipTests

# Use an official OpenJDK runtime as a parent image
FROM openjdk:8

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/DevOps_Project-Back-1.0.jar /app/DevOps_Project-Back-1.0.jar

# Expose the port that the application will run on
EXPOSE 8080

# Specify the command to run the application
CMD ["java", "-jar", "DevOps_Project-Back-1.0.jar"]
