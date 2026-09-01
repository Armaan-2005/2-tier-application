resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "project_vpc"
  }
}
resource "aws_subnet" "pub_subnet_a" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public"
  }
}
resource "aws_subnet" "priv_subnet_a" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private"
  }
}
resource "aws_subnet" "pub_subnet_b" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public"
  }
}
resource "aws_subnet" "priv_subnet_b" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private"
  }
}
resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.my_vpc.id
}
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.my_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }
}
resource "aws_route_table_association" "route" {
    subnet_id = aws_subnet.pub_subnet_a.id
    route_table_id = aws_route_table.routetable.id
}
resource "aws_route_table_association" "route2" {
    subnet_id = aws_subnet.pub_subnet_b.id
    route_table_id = aws_route_table.routetable.id
}
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits = 2048
}
resource "local_file" "priv_key" {
    filename = "my-key.pem"
    content = tls_private_key.key.private_key_pem
}
resource "aws_key_pair" "key_pair" {
  key_name = "my_key"
  public_key = tls_private_key.key.public_key_openssh
}