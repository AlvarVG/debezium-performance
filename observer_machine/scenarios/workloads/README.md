# YCSB WORKLOADS

This directory contains a collection of YCSB workload scripts used for benchmarking and performance testing of various data stores. Each workload file defines specific operation distributions, request patterns, and data characteristics tailored for scenarios.

## Standard Workloads

YCSB provides several predefined workloads for benchmarking common access patterns:

- **_examples/workload_a**: Update heavy workload (50% reads, 50% updates)
- **_examples/workload_b**: Read mostly workload (95% reads, 5% updates)
- **_examples/workload_c**: Read-only workload (100% reads)
- **_examples/workload_d**: Read latest workload (95% reads, 5% inserts)
- **_examples/workload_e**: Short ranges workload (95% scans, 5% inserts)
- **_examples/workload_f**: Read-modify-write workload (50% read-modify-write operations)
