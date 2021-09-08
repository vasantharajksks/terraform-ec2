#!/bin/bash
sudo yum install -y java-11-openjdk-devel
sudo yum upgrade -y
sudo yum install jenkins -y`
sudo systemctl start jenkins
