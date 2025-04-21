# Docker Compose Services

This directory contains modular service definitions to be imported into a primary docker-compose.yml stack. Each file defines a standalone containerized service (e.g., Kafka, ZooKeeper, cAdvisor) that can be reused across different environments.

## Purpose

* Promote reuse and separation of concerns in Compose-based projects
* Simplify service inclusion using the services: block or extends
* Enable consistent configuration across multiple stacks

## Usage

Include services by referencing the relevant file via Compose CLI or configuration merge tools.

## License

All configurations rely on open-source containers and are distributed under their respective licenses.