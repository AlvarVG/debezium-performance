variable "owner" {
  description = "Amazon AWS AMI owner ID"
  default     = "309956199498" # Red Hat's official AWS account ID
}

variable "name_filter" {
  description = "Amazon AWS AMI name filter"
  default     = "RHEL-9.5*"
}
