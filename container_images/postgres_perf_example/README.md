# PostgreSQL Performance Testing Image (for YCSB)

This Docker image provides a pre-configured PostgreSQL server environment prepared for performance testing with YCSB (Yahoo! Cloud Serving Benchmark). It is designed to simplify local or CI-based benchmarking workflows by exposing tunable server configurations, automatic initialization options, and compatible dataset handling.

## Features

Based on official PostgreSQL
Predefined schemas compatible with YCSB's jdbc binding
Automatic database/user/table creation for benchmarking
Supports external workload injection and metric collection

## License

This image is built on the official PostgreSQL image, licensed under the PostgreSQL license. All custom scripts and configurations are provided under the Apache License 2.0.
