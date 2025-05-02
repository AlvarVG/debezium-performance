output "grafana_url" {
  description = "Grafana URL to check performance results"
  value       = "${aws_instance.debezium_observer_instance.public_dns}:3000"
}

output "grafana_username" {
  description = "Grafana username to be used (if not changed)"
  value       = "debezium"
}

output "grafana_password" {
  description = "Grafana password to be used (if not changed)"
  value       = "debezium"
}

output "ssh_to_observer" {
  description = "SSH command to connect to the observer and generate all the load"
  value       = "ssh -i ./generated_files/${var.generated_key_filename}.pem ec2-user@${aws_instance.debezium_observer_instance.public_dns}"
}

output "ssh_to_observed" {
  description = "SSH command to connect to the observed and watch all the services run"
  value       = "ssh -i ./generated_files/${var.generated_key_filename}.pem ec2-user@${aws_instance.debezium_observed_instance.public_dns}"
}
