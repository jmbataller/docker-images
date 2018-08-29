#!/bin/bash

echo "starting zookeeper..."
zookeeper-server-start /opt/confluent-4.1.1/etc/kafka/zookeeper.properties &
while ! nc -z 127.0.0.1 2181; do sleep 1; done
echo "zookeeper started"


echo "starting kafka..."

# overwrite advertised listeners if env var is set
advertisedListeners=${KAFKA_ADVERTISED_LISTENERS:=localhost:9092}
sed -i "/advertised.listeners/c advertised.listeners=PLAINTEXT://$advertisedListeners" /opt/confluent-4.1.1/etc/kafka/server.properties

kafka-server-start /opt/confluent-4.1.1/etc/kafka/server.properties &
while ! nc -z 127.0.0.1 9092; do sleep 1; done
echo "kafka started"


echo "creating topics..."
OIFS="$IFS"
IFS=',' read -a topics <<< "$TOPICS"
IFS="$OIFS"

for t in "${topics[@]}"
do
    set -f; IFS=':'
    set -- $t

    kafka-topics --create --topic $1 --if-not-exists --zookeeper localhost:2181 --partitions $2 --replication-factor $3

    set +f; unset IFS
done
echo "topics created"


echo "starting schema-registry..."
schema-registry-start /opt/confluent-4.1.1/etc/schema-registry/schema-registry.properties
echo "schema-registry started"


