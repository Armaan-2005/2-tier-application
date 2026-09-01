resource "aws_security_group" "ec2_sg" {
    vpc_id = var.vpc_id
    description = "SSH,HTTP,HTTPS"
  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }
}
resource "aws_security_group" "rds-sg" {
  vpc_id = var.vpc_id
  description = "mySQL/Aurora"
  ingress {
    from_port = 3306
    to_port = 3306
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "tcp"
  }
    egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }
}