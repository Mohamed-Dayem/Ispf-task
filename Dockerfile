FROM openjdk:8-jdk

RUN groupadd -r maven && useradd -r -m -g maven maven

RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

RUN mkdir -p /home/maven/.m2/repository && \
    chown -R maven:maven /home/maven/.m2

USER maven

COPY pom.xml /home/maven/project/pom.xml
COPY src /home/maven/project/src
COPY --chown=maven:maven target /home/maven/project/target
WORKDIR /home/maven/project
RUN mvn -X package
CMD ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]


