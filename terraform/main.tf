terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

# Grupo de seguridad con nombre único para evitar conflictos
resource "aws_security_group" "app_sg" {
  name_prefix = "jikkosoft-app-sg-"
  description = "Security group for Jikkosoft application"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Node.js app access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "jikkosoft-app-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-025ca978d4c1d9825"
  instance_type = "t3.micro"
  key_name      = var.key_name
  associate_public_ip_address = true

  # Usar el security group personalizado
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  # Mejor manejo de user_data
  user_data = filebase64("${path.module}/user_data.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "jikkosoft-terraform-ec2"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}

output "app_url" {
  value = "http://${aws_instance.app_server.public_ip}"
}