# Prometheus Deployment

This repository contains configuration files for deploying Prometheus, the open-source monitoring and alerting toolkit. The deployment is structured to support customizable scraping configurations.

## Directory Structure

In this case we only have one file (`config.yaml`) where we are going to define the global configuration and the scrapping jobs.

## Configuration 

In order to configure the system you need to update the machine to be observed IP/domain, so prometheus can effectively grab the metrics from the deployments. Look for `<debezium_machine_ip>` and update it with the value of your machine. 
