provider "aws" {
  region = "us-east-2"

  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true

  default_tags {
    tags = {
      Author  = "Debezium"
      Project = "Debezium_Performance_Suite"
    }
  }
}

data "aws_region" "current" {}

terraform {
  required_version = "1.11.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.96.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}
