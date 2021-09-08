variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "your_pem_keyname"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "ami_id" {
  description = "ami id"
  default     =  "ami-0b9064170e32bde34"
}

variable "security_group" {
  description = "SG's for ec2"
  default     =  "sample"
}  
