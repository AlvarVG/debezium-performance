variable "generated_key_filename" {
  type        = string
  description = "Name of the generated ssh key"
  default     = "debezium_performance_key"
}

variable "observed_instance_type" {
  type        = string
  description = "Name of the generated ssh key"
  default     = "t3.xlarge"
}

variable "observer_instance_type" {
  type        = string
  description = "Name of the generated ssh key"
  default     = "t3.small"
}

variable "database_to_deploy" {
  type        = string
  description = "Database we are going to deploy"
  default     = "mysql"
  # Options: mysql, postgresql or mongodb
}
