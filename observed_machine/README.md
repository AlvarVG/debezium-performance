# OBSERVED MACHINE

This folder provides the necessary Docker Compose setup and configuration files to deploy a performance testing environment. It is designed to simulate production-like conditions to evaluate the behavior, reliability, and scalability of services under load. 

## Objective

The primary goal of this environment is to support structured performance testing initiatives, including:

* Load Testing: Measure system performance under expected user load.
* Stress Testing: Evaluate system behavior under extreme conditions.
* Scalability Analysis: Determine how well the system handles increasing demand.
* Bottleneck Identification: Uncover performance constraints in services or infrastructure.

## Environment Overview

To prevent other services/applications from affecting the test results, we will only deploy the same services on this machine that we would deploy in a production environment. In this case, this deployment runs containerized versions of kafka, debedzium and database services in a controlled and isolated environment. The environment mirrors production configurations as closely as possible, with the flexibility to adjust test-specific parameters through environment variables and configuration files.

## Architecture Overview

Please refer to the architecture diagram below for a visual overview of the deployed services and their interactions within the performance testing environment.

![observed_machine](../_images/observed_machine.png)
