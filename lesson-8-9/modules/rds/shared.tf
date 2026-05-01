resource "aws_db_subnet_group" "this" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "this" {
  name   = "rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_parameter_group" "this" {
  name   = "rds-params"
  family = "postgres15"

  parameter {
    name  = "max_connections"
    value = "100"
  }

  parameter {
    name  = "log_statement"
    value = "all"
  }

  parameter {
    name  = "work_mem"
    value = "4096"
  }
}