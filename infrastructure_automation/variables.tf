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
# t3.micro -> Not enough memory
# t3.large -> Not enough memory
# t3.xlarge -> Works fine

variable "observer_instance_type" {
  type        = string
  description = "Name of the generated ssh key"
  default     = "t3.small"
}
