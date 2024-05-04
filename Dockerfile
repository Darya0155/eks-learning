
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY Web/target/Web-1.0-SNAPSHOT.jar  /app/app.jar

EXPOSE 8089

CMD ["java", "-jar", "app.jar"]
