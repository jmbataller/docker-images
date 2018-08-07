#!/bin/bash

echo "starting zookeeper..."
zookeeper-server-start /opt/confluent-4.1.1/etc/kafka/zookeeper.properties &
while ! nc -z 127.0.0.1 2181; do sleep 1; done
echo "zookeeper started"


echo "starting kafka..."
kafka-server-start /opt/confluent-4.1.1/etc/kafka/server.properties &
while ! nc -z 127.0.0.1 9092; do sleep 1; done
echo "kafka started"


echo "starting schema-registry..."
schema-registry-start /opt/confluent-4.1.1/etc/schema-registry/schema-registry.properties
echo "schema-registry started"


