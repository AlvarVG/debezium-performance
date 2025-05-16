data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "debezium_performance_security_group" {
  name        = "debezium_performance_security_group"
  description = "Allow conections for prometheus, grafana and database services"
  vpc_id      = data.aws_vpc.default.id

  egress {
    description = "Allow connections from the machine to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Prometheus jobs"
    from_port   = 7070
    to_port     = 7079
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Grafana to be accessible"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Database specific connection ports
  ingress {
    description = "MySQL/Aurora"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MongoDB"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SQL Server"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Oracle Database"
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
