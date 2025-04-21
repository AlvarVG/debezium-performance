# TODOMySQL Performance Testing Image (for YCSB)

This Docker image provides a pre-configured MySQL server environment prepared for performance testing with YCSB (Yahoo! Cloud Serving Benchmark). It is designed to simplify local or CI-based benchmarking workflows by exposing tunable server configurations, automatic initialization options, and compatible dataset handling.

## Features

Based on official MySQL
Predefined schemas compatible with YCSB's jdbc binding
Tuned my.cnf settings for configurable performance testing
Automatic database/user/table creation for benchmarking
Supports external workload injection and metric collection

## Performance Tuning

To experiment with server-level performance configurations, supply your own my.cnf. Example parameters often tuned during testing:

## License

This image is built on the official MySQL image, licensed under the MySQL Community Edition license. All custom scripts and configurations are provided under the Apache License 2.0.
