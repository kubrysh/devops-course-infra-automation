provider "aws" {
  region = var.aws_region
}

# Set up Security Group
resource "aws_security_group" "tf-postgres-sg" {
  name        = "tf-postgres-sg"
  description = "Security group for EC2 instances with Postgres deployed via Terraform"

  # Allow inbound SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Allow inbound PostgreSQL (ports 5432-5435) from the same security group
resource "aws_security_group_rule" "allow_postgres_self" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5435
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tf-postgres-sg.id
  source_security_group_id = aws_security_group.tf-postgres-sg.id
}

resource "aws_instance" "tf-postgres" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_key
  security_groups = [aws_security_group.tf-postgres-sg.name]

  tags = {
    Name = var.instance_names[count.index]
  }
}

output "primary_ip" {
  value = aws_instance.tf-postgres[0].public_ip
}

output "replica_ip" {
  value = aws_instance.tf-postgres[1].public_ip
}
