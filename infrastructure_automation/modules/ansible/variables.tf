variable "inventory" { 
  description = "Inventory YAML file name"
  default     = "./generated_files/hosts.yaml"
}

variable "playbook" {
  description = "Playbook file"
  type        = string
}

variable "hosts" {
  description = "Map of host-alias and ip-addresses"
  type        = map(string)
}

variable "hosts_ssh_user" {
  description = "Map of host-alias and the ssh user when running Ansible"
  type        = map(string)
  default     = {}
}

variable "vars" {
  description = "Map of variables to pass to Ansible"
  type        = any # Required to allow map with different types
  default     = {}
}

variable "ansible_ssh_user" {
  description = "User to log in the hosts"
  default     = "ec2-user"
}

variable "ansible_ssh_key" {
  description = "SSH key to log in the hosts"
  type        = string
  default     = ""
}

variable "connection_timeout" {
  description = "Initial connection timeout in seconds"
  default     = 120
}

