FROM maven:3.6-jdk-11-slim AS build

WORKDIR /workspace

COPY pom.xml /workspace

RUN mvn dependency:go-offline -B

COPY src /workspace/src

RUN mvn package -DskipTests

FROM openjdk:11.0.13-jre-slim

WORKDIR /app
COPY --from=build /workspace/target/*.jar /app/application.jar

ENV PROFILE=dev
ENV MYSQL_HOST=localhost

RUN apt-get update && apt-get install -y wget

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN apt-get remove wget -y

EXPOSE 8080

ENTRYPOINT [ "dockerize", "-wait", "tcp://db-mysql:3306", "-timeout", "40s"]

CMD ["java", "-Xms128m", "-Xmx256m", "-jar", "application.jar"]