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
