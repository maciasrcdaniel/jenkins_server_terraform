# Configuring the aws provide. We have previously created a role and gave it the proper permission. 
provider "aws" {
  region  = "us-east-1"
  profile = "luit-user"
}

# Create our ec2 resource

resource "aws_instance" "jenkins_server" {
  ami                    = var.ec2_ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.jenkins_terra_sg.id]
  key_name               = var.ssh_key
  user_data              = var.user_data
}

# Create your security groups
resource "aws_security_group" "jenkins_terra_sg" {
  name        = "jenkins_terra_sg"
  description = "security group for jenkins"
  vpc_id      = var.aws_vpc

  # ssh from my IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_pub_ip]
  }

  # Jenkins access:8080
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Default egress rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_terra_sg"
  }
}
