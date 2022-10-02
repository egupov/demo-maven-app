FROM tomcat:10.0-jdk11-temurin-focal

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
  && apt-get install -y \
             apt-utils \
             git \
             maven
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    cd boxfuse-sample-java-war-hello/ && \
    mvn package && \
    cp /usr/local/tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
