#!/bin/bash

# change to root user
sudo su
# update the instance
yum update -y
# retrieve the jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
# import setup key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# upgrade your instance
yum upgrade
# install java as jenkins requires java
dnf install java-17-amazon-corretto -y
# install jenkins
yum install jenkins -y
# enable and start jenkins
systemctl enable jenkins
systemctl start jenkins