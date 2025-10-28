# Automated Infraestucture Deployment

This Terraform project provisions two virtual machines, described bellow, and provision all the software on each of them:

* **Observed Machine**: Machine where we are deploying Debezium and all of its related dependencies (Kafka, a database, etc.)
* **Observer Machine**: Machine responsible for running all the monitoring software (Prometheus and Grafana) and execute the load against the observed machine.

## Prerequisites

- Terraform >= 1.3
- Access to a cloud provider account, at this time only for AWS.
- Properly configured credentials (e.g., `~/.aws/credentials`)

## Usage

1. Clone the repository:

```bash
git clone <repo-url>
cd debezium-performance/infrastructure_automation
```

2. Review and adjust the variables.tf file to match your configuration. In case you dont want to share the content of your variables, you can use variables.tfvars file.

3. Initialize and apply the configuration:

```bash
terraform init
terraform apply
```

4. Upon completion, Terraform will output the public IPs of the two machines, the credentials being used in Grafana as well as the url where you can check the results in grafana.

## Post-Deployment Tasks

Once this script has run, you should be able to view Grafana dashboards (with the specific content for the Debezium Server monitoring) and connect to that machine via SSH to generate all the load into the observed machine (using the already copied scripts).

When the load scripts finishes, you can then check out the performance results. 
