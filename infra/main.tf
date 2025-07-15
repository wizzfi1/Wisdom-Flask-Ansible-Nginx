provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "deployer" {
  key_name   = "github-deploy-key"
  public_key = file("${path.module}/github-deploy.pub")
}

resource "aws_security_group" "wisdom_sg" {
  name        = "wisdom-flask-sg"
  description = "Allow Flask, SSH, HTTP, and HTTPS"

  ingress {
    description = "Flask app port"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP (Certbot)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "flask_ec2" {
ami = "ami-053b0d53c279acc90"  # ✅ Ubuntu 22.04 LTS (x86_64) for us-east-1
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.wisdom_sg.id]

  tags = {
    Name = "Wisdom-Flask-EC2"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ec2_ip.txt"
  }
}

output "ec2_public_ip" {
  value = aws_instance.flask_ec2.public_ip
}
