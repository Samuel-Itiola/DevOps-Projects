variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
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
