# Container Resource Monitoring with cAdvisor (Integrated in Compose)

This project integrates cAdvisor into a working docker-compose.yml stack to monitor the resource usage (CPU, memory, I/O, and network) of all containers involved in performance testing. It is particularly useful when benchmarking applications such as MySQL or YCSB and provides visibility into runtime performance bottlenecks.

## Purpose

By including cAdvisor in the same docker-compose.yml as your performance testing services, you gain:

* Real-time monitoring of CPU, memory, disk I/O, and network stats
* Metrics visualization through a web UI
* Compatibility with Prometheus/Grafana for long-term metrics analysis

## License

This integration uses open-source tools:

* cAdvisor – Apache License 2.0
* Docker Compose – MIT License
