# Apache ZooKeeper Service (Integrated in Compose)

This project integrates Apache ZooKeeper into a working docker-compose.yml stack to support distributed systems coordination. It is typically used as a core dependency for services such as Kafka or for scenarios requiring leader election, configuration management, and service synchronization.

## Purpose

By including ZooKeeper in the same docker-compose.yml as your distributed or stateful services, you gain:

* Lightweight and reliable coordination for distributed systems
* A consistent metadata and synchronization layer
* Easy integration with services like Apache Kafka, HBase, and others

## License

This integration uses open-source tools:

* Apache ZooKeeper – Apache License 2.0
* Docker Compose – MIT License