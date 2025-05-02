output "ami_id" {
  description = "ID of the AMI found by the filter"
  value       = data.aws_ami.ami.id
}
