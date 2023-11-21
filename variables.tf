variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "my_pub_ip" {
  type    = string
  default = "99.48.30.192/32"
}

variable "vpc_name" {
  type    = string
  default = "jenkins_vpc"
}

variable "aws_vpc" {
  type    = string
  default = "vpc-09f00ae01264b588f"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0d2606ac1c3052703"
}

variable "ec2_ami" {
  type    = string
  default = "ami-0230bd60aa48260c6"
}

variable "ssh_key" {
  type    = string
  default = "jenkinskeys"
}

