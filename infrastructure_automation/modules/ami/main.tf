data "aws_ami" "ami" {
  most_recent = true
  owners      = [var.owner]

  filter {
    name   = "name"
    values = [var.name_filter]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
