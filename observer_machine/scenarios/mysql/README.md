# Custom YCSB Deployment for MySQL

This deployment utilizes the YCSB (Yahoo! Cloud Serving Benchmark) to simulate load and evaluate the performance of debezium. The benchmark executes a configurable workload and measures key performance metrics such as throughput, latency, and error rates.

This deployment is intended for internal performance testing and is configured to generate sustained and realistic load patterns on the database under evaluation.

## Folder Structure

* ycsb_config/conf: Folder to store the YCSB configuration files (.properties) defining database connections
* ycsb_config/results: Placholder where all the YCSB are place its results.
* [workloads](../workloads/): Folder where are the different YCSB are stored. 

## Setup Instructions

1. Configure your database connection. 
2. Define (or select) your workload to be used. In case you are creating a custom one, please refer to [YCSB Wiki](https://github.com/brianfrankcooper/YCSB/wiki/Implementing-New-Workloads)
3. Edit the `docker-compose.yaml` file with the previous steps outcome. And edit the load image environmental variables. Refer to [Custom YCSB image](../../../container_images/ycsb_jdbc/README.md). 
