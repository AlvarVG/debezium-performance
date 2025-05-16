# Terraform Modules

This directory contains a collection of reusable Terraform modules designed to standardize and simplify infrastructure provisioning across multiple projects and environments. Each subdirectory represents a standalone Terraform module. Modules are grouped by functionality. By now only the following modules are on place:

* **ami**: This module gets an ami given the owner and a name filter.
* **ansible**: This module runs  an ansible playbook.


## Usage

To use a module in your Terraform configuration:

```hcl
module "example" {
  source = "../terraform-modules/<module-name>"
  # Pass required input variables
}
