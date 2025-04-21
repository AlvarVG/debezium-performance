# YCSB JDBC Docker Image (MySQL & PostgreSQL)

This Docker image provides a pre-configured environment for running YCSB (Yahoo! Cloud Serving Benchmark) tests using the JDBC bindings for MySQL and PostgreSQL databases. It simplifies benchmarking relational databases by packaging all required tools, drivers, and configurations in a containerized format.

## Features

* YCSB core and JDBC bindings included
* Pre-installed MySQL and PostgreSQL JDBC drivers
* Lightweight, reproducible container environment
* Configurable runtime parameters through environment variables or volume mounts

## Supported Databases

* MySQL (tested with 8.0.32)
* PostgreSQL (not yet tested)

## Usage

To run a YCSB workload against a JDBC-compatible database, use the following command:

```bash
    docker run --rm --name ycsb \
        -e WORKLOAD_FILENAME=1t_100kr_05r_025i_025u \
        -e CONFIG_FILENAME=mysql.properties \
        -e TABLE_NAME=usertable_0 \
        -e NUM_PROCESSES=1 \
        -e TOTAL_RECORDS=100000 \
        -e MAX_THROUGHPUT=100 \
        -e DEBUG=false \
        -v $(pwd)/ycsb_config/conf:/ycsb/conf \
        -v $(pwd)/ycsb_config/results:/ycsb/results \
        -v $(pwd)/workloads:/ycsb/workloads \
        <YOUR_IMAGE>
```

## Volumes

There are mainly three folders you can shared with your image.

* /ycsb/conf/: You are supposed to store here the database configuration files here. Look at YCSB to fill them up.
* /ycsb/workloads/: In case you have specific workload files, you have to place them here.
* /ycsb/results/: Whenever a scipt finishes, all the results are going to be stored in here in the format {TABLE_NAME}.dat

## Environment Variables

You can also configure extended behavior (provided by this image) with the following environmental variables:

* WORKLOAD_FILENAME: The workload file to be used with this script. Default: workloada from original YCSB repo.
* CONFIG_FILENAME: The configuration file used by the script. Default: mysql.properties from the [conf](./conf/mysql.properties) folder.
* TABLE_NAME: Table name to pt the load into. Default: usertable_0, it has to be compliant with YCSB table schea.
* NUM_PROCESSES: You can split the load into different processes. Default: 1
* TOTAL_RECORDS: Amount of records to work with. Only applies if NUM_PROCESSES > 1. Default: 10000
* MAX_THROUGHPUT: Target troughput the script is aming for. Used to avoid: Coordinated Omission. Default: 1000
* DEBUG: If enabled, prints all the commands being run by the script. Default: false

## Limitations

* Only jdbc binding is supported in this image.
* Only MySQL and PostgreSQL drivers are included.
* For additional database support, extend this image with the relevant JDBC drivers.

## License

YCSB is licensed under the Apache License 2.0. This image includes third-party JDBC drivers whose licenses are compatible with container distribution; refer to the respective licenses for MySQL and PostgreSQL drivers.
