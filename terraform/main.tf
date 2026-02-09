terraform {
  required_providers {
    aws = {
      source = "harshicorp/aws"
      version = "latest"
    }
  }
  backend "s3" {
    key = "aws/ec2-deploy/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.miniroup.id]
  iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
  tags = {
    Name = var.instance_name
}
  connection {
    type = "ssh"
    host = self.public_ip
    user = "Ubuntu"
    private_key = var.private_key
    timeout = "4"
  }
}

resource "aws_instance_group" "ec2-profile" {
  name = "ec2-profile"
  role = "Ecr_Auth"
}

resource "aws_security_group" "miniroup" {
  egress{
    cidr_blocks = ["0.000.0/0"]
    description = "Allow all outbound traffic"
    from_port = 0
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    protocol = "-1"
    security_groups = []
    self = false
    to_port = 0
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all inbound traffic"
    from_port = 0
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    protocol = "tcp"
    security_groups = []
    self = false
    to_port = 22
  }
  {
    cidr_blocks = ["0.0.0/0"]
    description = "Allow all inbound traffic"
    from_port = 0
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    protocol = "tcp"
    security_groups = []
    self = false
    to_port = 80
  }
}

resource "aws_key_pair" "deployer" {
  key_name = var.key_name
  public_key = var.public_key
}

output "instance_public_ip" {
  value = aws_instance.server.public_ip
  sensitive = true

}