variable "generated_key_filename" {
  type        = string
  description = "Name of the generated ssh key"
  default     = "debezium_performance_key"
}

variable "observed_instance_type" {
  type        = string
  description = "Name of the generated ssh key"
  default     = "c5a.xlarge"
}

variable "observed_intance_storage_size" {
  type        = string
  description = "Amount of storage used for docker containers"
  default     = "500"
}

variable "observer_instance_type" {
  type        = string
  description = "Name of the generated ssh key"
  default     = "c5a.xlarge"
}

variable "database_to_deploy" {
  type        = string
  description = "Database we are going to deploy"
  default     = "mysql"
  # Options: mysql or postgresql
}

variable "workload_to_run" {
  type        = string
  description = "Which workload are you going to run"
  default     = "05i_05u_uniform"
  # Options: Pick one from observer_machine/scenarios/workloads/
}

variable "desired_throughput" {
  type        = string
  description = "The troughput goal you will like to achieve"
  default     = "100"
}

variable "tables_to_use" {
  type        = string
  description = "Where are the registries going to be inserted"
  default     = "usertable_0"
  # Options: Select any combinations from usertable_0,usertable_1,usertable_2,usertable_3,usertable_4,usertable_5,usertable_6,usertable_7,usertable_8,usertable_9
}

variable "thread_count" {
  type        = string
  description = "Number of threads to be used in the YCSB process"
  default     = "20"
}

variable "registries_count" {
  type        = string
  description = "Numner of registries to be inserted in each execution"
  default     = "1000000"
}
