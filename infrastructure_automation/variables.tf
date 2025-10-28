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
  default     = "postgresql"
  # Options: mysql or postgresql
}

variable "workload_to_run" {
  type        = string
  description = "Which workload are you going to run"
  default     = "1t_1m_05i_05u_uniform"
  # Options: Pick one from observer_machine/scenarios/workloads/
}

variable "desired_throughput" {
  type        = string
  description = "The troughput goal you will like to achieve"
  default     = "100"
}

variable "num_ycsb_process" {
  type        = string
  description = "How many ycsb processes you want to run in parallel"
  default     = "1"
}

variable "tables_to_use" {
  type        = string
  description = "Wherer "
  default     = "usertable_0"
  # Options: Select any combinations from usertable_0,usertable_1,usertable_2,usertable_3,usertable_4,usertable_5,usertable_6,usertable_7,usertable_8,usertable_9
}
