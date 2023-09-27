FROM maven:3.8.3-openjdk-17 as build

COPY . .
RUN mvn clean package -DskipTests

# Pacakgae stage
FROM openjdk:17-jdk-slim

COPY --from=build /target/JBS-0.1.jar app.jar

EXPOSE 5500
ENTRYPOINT [ "java", "-jar", "app.jar" ]
