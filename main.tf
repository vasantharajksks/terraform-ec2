provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "Instance1" {
  ami = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  associate_public_ip_address = "true"
  subnet_id = var.subnet_id
  security_groups= ["${var.security_group}"]
  tags= {
    Name = "jenkins_instance"
  }
  user_data = "${file("userdata.sh")}"
}

output "jenkins_endpoint" {
  value = formatlist("http://%s:%s/", aws_instance.Instance1.*.public_ip, "8080")
}
