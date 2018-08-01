FROM gradle:4.8-jdk10-slim
MAINTAINER jmbataller

USER root

# install docker-compose
RUN mkdir /opt/docker-compose
RUN mkdir /opt/docker-compose/bin
RUN wget -O /opt/docker-compose/bin/docker-compose https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)
RUN chmod +x /opt/docker-compose/bin/docker-compose
RUN ln --symbolic "/opt/docker-compose/bin/docker-compose" /usr/bin/docker-compose
RUN export PATH=$PATH:/opt/docker-compose/bin

# Create Gradle volume
USER gradle
VOLUME "/home/gradle/.gradle"
WORKDIR /home/gradle




