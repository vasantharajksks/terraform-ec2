#!/bin/bash
sudo yum install -y jenkins java-11-openjdk-devel
sudo yum upgrade -y
sudo yum install jenkins -y`
sudo systemctl start jenkins
