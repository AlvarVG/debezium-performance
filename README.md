# DEBEZIUM PERFORMANCE BENCHMARKING

This repository contains tools, configurations, and test cases for evaluating the performance of [Debezium](https://debezium.io/), an open-source distributed platform for change data capture (CDC). The primary objective of this project is to benchmark Debezium's performance across various scenarios, including:

- Change event throughput (inserts, updates, deletes)
- Latency of change propagation
- Resource utilization (CPU, memory, network I/O)
- Scalability under load
- Performance across different connectors (e.g., MySQL, PostgreSQL, MongoDB)

## Repository Structure

Here we have three main folders:

* container_images: This folder contains all the docker images used for different purposes: databases, ycsb, etc; all prepared to be run within this benchmarking framework.
* observed_machine: All the deployment and configurations needed to replicate a production ready environment, from which this framework gets and stores the data.
* observer_machine: Monitoring (prometheus + grafana) deployment and configuration and YCSB load deployments. 

## Architecture Overview

If you want to have a clearer overview of the architecture, you can just take a look to the following image:

![complete_arch](./_images/complete_arch.png)

## Getting Started

### Prerequisites

In order to run all the different deployments two different machines needs to be deployed (in order to not affect the resutls):

* Observed machine: Where we are going to deploy zookeeper, kafka, debezium and the selected database.
* Observer machine: Where the monitoring solution and the database load are going to be deployed.

The complete benchmark is performed over docker containers, no need to install more dependencies:

* Docker
* Docker Compose

### Setup observed machine

1. SSH into your machine. 
2. Clone the repository.
3. Go to the database of your election folder: taking MySQL as example `observed_machine/mysql`.
4. Spin up all the deploymentsL: run `docker compose up -d`
5. Wait until all the services are up and running.

```bash
    ssh *************
    git clone ********
    cd observed_machine/mysql
    docker-compose up -d
```

### Setup observer machine

1. SSH into your machine. 
2. Clone the repository.
3. Go to the monitoring folder `observer_machine/monitoring`.
4. Update the prometheus [configuration file](./observer_machine/monitoring/prometheus/config.yaml) with the address/domain of the observed machine.
5. Spin up the monitoring services: run `docker compose up -d`
6. Wait until the services are up and running and you see data flowing in Grafana.
7. Go to the scenario of your interest: exmaple mysql streaming folder `observer_machine/scenarios/mysql`.
8. Customize the workload configurations.
9. Run the load scripts: run `docker compose up -d`
10. Wait the processes to finish and checkout the results in Grafana.

```bash
    ssh *************
    git clone ********
    cd observer_machine/monitoring
    vi prometheus/config.yaml # Edit this file with yor addresse/domain
    docker-compose up -d
    cd ../scenarios/mysql
    vi docker-compose.yaml # Edit this file with yor load and configuration
    docker-compose up -d
    # Check out results in Grafana (<machine_ip>:3000)
```

## Benchmark Scenarios

With the actual configuration only streaming for MySQL is supported. But shortly more scenarios are going to become available. Until now the following performance scenarios are covered:

- Insert-heavy workloads
- Update-dominant streams
- Mixed CRU operations
- High-volume batch operations

## Metrics and Analysis

Database performance metrics are stored in the `results/` directory. Meanwhile the debezium and database behaviors are available at Grafana dashboards. There you can find all the information: 

- Throughput over time
- Lag and latency distributions
- Connector task performance
- Debezium metrics
- Database metrics

## Customization

This framework is highly configurable, you can go an edit it depending on your needs:
You can adjust test parameters, data schemas, and Debezium configurations to reflect your environment and requirements.

- All the Docker services are modifiable in each `docker-compose.yml` file.
- The different connectors configurations can be edited depending on your needs in `debezium_config/application.properties`.
- Docker image versions and environmental variables can be editted in the respective `.env` files. 

## Tracking the progress

Therer are still few things developed, if you want to improve this framewrok, please visit the [TODO document](./TODO.md) and pick any of the topics in there. 

## References

- [Debezium Documentation](https://debezium.io/documentation/)
- [YCSB](https://github.com/brianfrankcooper/YCSB)
- [Coordinated Omission](https://www.scylladb.com/2021/04/22/on-coordinated-omission/)
- [How Not To Measure Latency](https://qconsf.com/sf2012/dl/qcon-sanfran-2012/slides/GilTene_HowNotToMeasureLatency.pdf)

## Contribution

The Debezium community welcomes anyone that wants to help out in any way, whether that includes reporting problems, helping with documentation, or contributing code changes to fix bugs, add tests, or implement new features. See [this document](https://github.com/debezium/debezium/blob/7b8cceec8ada6b6a72122c17f0fa74985c1dae22/CONTRIBUTE.md) for details.
