# MySQL Environment

This repository contains a Docker Compose setup used to orchestrate Kafka, MySQL and Debezium. It utilizes a .env file for environment variables and includes several configuration directories to manage service-specific configurations.

## Structure

* debezium_config/: Stores the debezium configuration and metrics exporter configuration.
* exporter_config/: Stores the mysql exporter configurations.
* docker-compose.yml: Spins ups all the services
* .env: Contains the environmental variables used in the docker compose file

## Usage

Build and Start Services

To start the services in detached mode:

```bash
docker-compose up -d
```

To stop the running services:

```bash
docker-compose down
```

## License

This project is provided under the MIT License. See LICENSE for details.