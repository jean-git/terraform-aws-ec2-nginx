# Create a new instance of the latest Ubuntu 18.04 on an
# t2.nano node with an AWS Tag naming it "nginx"
provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }

  owners = ["099720109477"] # Canonical

}

resource "aws_instance" "nginx" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"
  key_name = "aws-key-us-east-2"
  tags = {
    Name = "nginx"
  }
  user_data = file("install_nginx.sh")

  vpc_security_group_ids = [
    aws_security_group.sg_default_ports.id,
  ]

}

resource "aws_security_group" "sg_default_ports" {
  name = "web-access-group"
  description = "Allow traffic on port 80 (HTTP), 443 (HTTP) and 22(SSH)"

  tags = {
    Name = "Security Group - Default Ports"
  }

  ingress { #Allow traffic on port 80 (HTTP)
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress { #Allow traffic on port 443 (HTTPS)
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress { #Allow traffic to port 22 (SSH)
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  egress { #Allow traffic to leave the AWS instance
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }  

}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.nginx.*.public_ip
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.nginx.*.public_dns
}