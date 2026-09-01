
resource "aws_instance" "ec2_a" {
  ami = var.ubuntu
  availability_zone = "us-east-1a"
  instance_type = var.inst_type
  key_name = var.key
  subnet_id = var.subnet_1a
  associate_public_ip_address = true
  vpc_security_group_ids = [ var.vpc-sg ]
  user_data = <<-EOF
  #!/bin/bash
  apt update
  apt install apache2 -y
  systemctl enable apache2
  systemctl start apache2
  echo "Hello from 1st lb" > /var/www/html/index.html
  EOF
  tags = {
    Name = "1a_ec2"
  }
}
resource "aws_instance" "ec2_b" {
  ami = var.ubuntu
  availability_zone = "us-east-1b"
  instance_type = var.inst_type
  key_name = var.key
  subnet_id = var.subnet_1b
  associate_public_ip_address = true
  vpc_security_group_ids = [ var.vpc-sg ]
  user_data = <<-EOF
  #!/bin/bash
  apt update -y
  apt install apache2 -y
  systemctl enable apache2
  systemctl start apache2
  echo "Hello from 2nd lb" > /var/www/html/index.html
  EOF
  tags = {
    Name = "1b_ec2"
  }
}