module "ami" {
  source = "./modules/ami"
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

  tags = {
    Name = "debezium_observed_instance"
  }
}
