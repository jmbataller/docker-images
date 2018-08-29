
# kafka-zookeeper-schema-registry

## jmbataller/kafka-zookeeper-schema-registry

Docker image that contains zookeeper, kafka and schema-registry (4.1.1 version) in one single image.  The purpose of the custom image is to use it as a `service` in integration testing jobs of the gitlab-ci pipeline.

> The configuration os the broker is setup for testing purposes, not advisable for other uses.

## Usage

If you would like to create topics in Kafka during startup of the docker container, set the environment variable `TOPICS` with the list of topics.

Sample:

```
TOPICS=topic1:3:1,topic2:3:1
```

the list of topics is comma-separated and each topic contains `<name of topic>:<num partitions>:<replication factor>`
