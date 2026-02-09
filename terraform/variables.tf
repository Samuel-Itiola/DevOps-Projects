variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "ami" {
  type = string
  default = "ami-018ff7ece22bf96db"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "ec2-server"
}

variable "public_key" {
  type = string
}

variable "private_key" {
  type = string
}

variable "key_name" {
  type = string
}
