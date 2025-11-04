module "ami" {
  source      = "./modules/ami"
  name_filter = "RHEL-9.5*"
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.generated_key_filename
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_sensitive_file" "ssh_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "./generated_files/${var.generated_key_filename}.pem"
  file_permission = "0400"
}

resource "aws_instance" "debezium_observer_instance" {
  ami                         = module.ami.ami_id
  instance_type               = var.observer_instance_type
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.debezium_performance_security_group.id]

  tags = {
    Name = "debezium_observer_instance"
  }
}

resource "aws_instance" "debezium_observed_instance" {
  ami                         = module.ami.ami_id
  instance_type               = var.observed_instance_type
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.debezium_performance_security_group.id]

  # Root volume (size as you wish)
  root_block_device {
    volume_size           = "${var.observed_intance_storage_size}"
    delete_on_termination = true
  }

  tags = {
    Name = "debezium_observed_instance"
  }
}

module "ansible_observed" {
  source          = "./modules/ansible"
  playbook        = "./ansible_playbooks/observed_machine.yaml"
  inventory       = "./generated_files/observed_host.yaml"
  hosts           = { observed = aws_instance.debezium_observed_instance.public_ip }
  hosts_ssh_user  = { observed = "ec2-user" }
  ansible_ssh_key = "./generated_files/${var.generated_key_filename}.pem"
  requirements_file = "./ansible_playbooks/requirements.yaml"
  vars = {
    database_type = var.database_to_deploy
  }
}

module "ansible_observer" {
  source            = "./modules/ansible"
  playbook          = "./ansible_playbooks/observer_machine.yaml"
  inventory         = "./generated_files/observer_host.yaml"
  hosts             = { observer = aws_instance.debezium_observer_instance.public_ip }
  hosts_ssh_user    = { observer= "ec2-user" }
  ansible_ssh_key   = "./generated_files/${var.generated_key_filename}.pem"
  requirements_file = "./ansible_playbooks/requirements.yaml"
  vars = {
    observed_instance_address = aws_instance.debezium_observed_instance.public_dns
    workload_to_run = var.workload_to_run
    tables_to_use = var.tables_to_use
    desired_throughput = var.desired_throughput
    thread_count = var.thread_count
    registries_count = var.registries_count
  }
}
