# MONITORING DEPLOYMENT

This folder provides the necessary Docker Compose setup and configuration files to deploy a monitoring environment. It is designed to provide and out of the box configuration for debezium monitoring. 

## Objective

The main objective of this deployment is to establish a centralized monitoring system using **Prometheus** and **Grafana** to collect, store, and visualize metrics from a **remote machine**. This setup is suitable for observing system health, resource usage, or custom application metrics from distributed nodes in real-time.

## Environment Overview

- Monitoring Stack Location: Local or central monitoring server
- Target System: Remote machine(s) exposing metrics via HTTP
- Data Collection: Prometheus scrapes remote metrics at defined intervals
- Visualization: Grafana displays collected metrics via predefined dashboards

## Architecture Overview

Please refer to the architecture diagram below for a visual overview of the deployed services and their interactions within the performance testing environment.

![observer_machine](../../_images/observer_machine.png)
