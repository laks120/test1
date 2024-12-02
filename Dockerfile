FROM maven:3.9.0-eclipse-temurin-17 AS builder

WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk17-openjdk-slim

WORKDIR /usr/local/tomcat/webapps

COPY --from=builder /app/target/helloworld-web-1.0-SNAPSHOT.war ./ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]