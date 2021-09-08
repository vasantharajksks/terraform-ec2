provider "aws" {
  region = var.aws_region
}

data "template_file" "user_data" {
template = "${file("./userdata.sh")}"
}

#Create security group with firewall rules
resource "aws_security_group" "security_jenkins_port" {
  name        = "security_jenkins_port"
  description = "security group for jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_jenkins_port"
  }
}

resource "aws_instance" "Instance1" {
  ami = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  associate_public_ip_address = "true"
  security_groups= [ "security_jenkins_port"]
  tags= {
    Name = "jenkins_instance"
  }
  user_data = "${data.template_file.user_data.rendered}"
}

output "jenkins_endpoint" {
  value = formatlist("http://%s:%s/", aws_instance.Instance1.*.public_ip, "8080")
}
