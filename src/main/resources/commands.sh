#!/usr/bin/env bash

# Start all the services (zk, kafka, schema-registry, rest-proxy, connect)
# Warning: not recommended to use for production services, only for development
confluent start

# services status
confluent status

# Stateless transformations demo
./kafka-console-producer --broker-list localhost:9092 --topic kafkameetup-words-input
./kafka-console-consumer --bootstrap-server localhost:9092 --topic kafkameetup-words-input

./kafka-console-consumer --bootstrap-server localhost:9092 --topic kafkameetup-words-keyed --property print.key=true

# Stateful transformations demo
# see debug output
./kafka-console-consumer --bootstrap-server localhost:9092 --topic kafkameetup-wordcount-grouped --property print.key=true

# Show Kafka topics
./kafka-topics --zookeeper localhost:2181 --list

# stop all services
confluent stop

# destroy log files and tmp state files
confluent destroy