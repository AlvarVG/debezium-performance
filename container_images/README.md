# PERFORMANCE TESTING CONTAINER IMAGES

This repository hosts a collection of pre-built container images designed specifically for performance testing scenarios. These images are optimized for various testing tools, configurations, and environments to streamline benchmarking, load testing, and performance evaluation activities. 

## Overview

The images provided in this repository support consistent and repeatable performance testing workflows. Each image is built with the necessary tools, dependencies, and configurations required for specific test cases or load generation setups.

## Contents

The repository includes container images for the following use cases:

* [MySQL](./mysql_perf_example/): Image based on [debezium mysql example](https://quay.io/repository/debezium/example-mysql) curated to be used with this performance framework. 
* [YCSB JDBC](./ycsb_jdbc/): Image based on the thr [YCSB tool](https://github.com/brianfrankcooper/YCSB). With this image the load is being generated. 

## Image Structure

Each image is located in its own subdirectory and contains:

* Dockerfile: Instructions to build the image.
* README.md: Details specific to the image (e.g., usage instructions, environment variables).
* Other files: Ranging from configuration files, datasets, enviromental or entrypoint scripts. 

## Usage

You can pull and run the images directly using Docker or deploy them in Kubernetes or other container orchestration platforms. Instructions for use are provided within the respective folder of each tool.

## Shared Makefile

A [shared Makefile](./Makefile.common) is used across all image directories to standardize and simplify common tasks such as building, tagging, and pushing container images. This approach promotes consistency and reduces maintenance overhead.

### Available Makefile Jobs

* make build: Locally builds the docker image. 
* make dev: Builds and pushed the image with `-dev` appended to the image tag. 
* make latest: Builds and pushed the image, with the mentioned version and latest tag. Intended for CI only. 

### Customization Instructions

To adapt the Makefile for your own use, you should modify first the common Makefile, in order to label and push the images to your own repo. For that purpose you need to change the line `REGISTRY=<YOUR_REGISTRY_REPO_URL>`

And then, en each image, you have to define the following variables in their respective Makefile file:

* IMAGE_NAME: Name of the container image
* IMAGE_VERSION: Version of the container image
* IMAGE_PLATFORMS: Target platforms for image building
