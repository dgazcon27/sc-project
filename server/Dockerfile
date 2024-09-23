FROM ubuntu:24.04

RUN apt update
RUN apt install -y default-jdk
RUN apt install -y default-jre
RUN apt install -y maven
RUN apt install -y ant

ENV	TINI_VERSION v0.19.0
ADD	https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN	chmod +x /tini

#Install tomcat
RUN groupadd tomcat
RUN useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.94/src/apache-tomcat-9.0.94-src.tar.gz /tmp
WORKDIR /tmp

RUN tar xzvf apache-tomcat-9.0.94-src.tar.gz
RUN mv apache-tomcat-9.0.94-src /opt/tomcat

WORKDIR /opt/tomcat

RUN chgrp -R tomcat /opt/tomcat
RUN chmod -R g+r conf && chmod g+x conf
RUN chmod +x /opt/tomcat/bin/*
RUN mkdir work temp logs

RUN chown -R tomcat webapps/ work/ temp/ logs/
COPY tomcat.service /etc/systemd/system/tomcat.service

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH" 
RUN export PATH
WORKDIR /
EXPOSE 8080

ENTRYPOINT	    ["/tini", "--"]
CMD             ["cmd", "/opt/tomcat/bin/catalina.sh", "run"]