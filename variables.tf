variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "test"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "ami_id" {
  description = "ami id"
  default     =  "ami-087c17d1fe0178315"
}

variable "security_group" {
  description = "SG's for ec2"
  default     =  "sg-00ec8e66e6e7ab58b"
}

variable "subnet_id" {
  description = "Subnet Id"
  default     =  "subnet-0412d404b91a1ecea"
}
