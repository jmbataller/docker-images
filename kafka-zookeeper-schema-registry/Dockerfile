# kafka, zookeeper and schema-registry

FROM java:openjdk-8-jre

# add confluent config
RUN mkdir /opt/confluent-4.1.1
ADD etc /opt/confluent-4.1.1/etc

# install confluent package
RUN wget -qO - http://packages.confluent.io/deb/3.0/archive.key | apt-key add -
RUN apt-get update
RUN apt-get install software-properties-common python-software-properties -y
RUN add-apt-repository "deb [arch=amd64] http://packages.confluent.io/deb/3.0 stable main"
RUN apt-get update
RUN apt-get install confluent-platform-2.11 -y

# 2181 is zookeeper, 9092 is kafka, 8081 is schema-registry
EXPOSE 2181 9092 8081

# add start script
RUN apt-get update
RUN apt-get install netcat -y
ADD start.sh /opt/confluent-4.1.1/etc
RUN chmod +x /opt/confluent-4.1.1/etc/start.sh


ENTRYPOINT ["/bin/bash", "/opt/confluent-4.1.1/etc/start.sh"]
