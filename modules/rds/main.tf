resource "aws_db_subnet_group" "db_subnet" {
  subnet_ids = var.subet_rds
}
resource "aws_db_instance" "my_db" {
  db_name = "twotier_db"
  engine = "mysql"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  username = "admin"
  password = "Armaan2005"
  vpc_security_group_ids = [var.rds_sg]
  availability_zone = "us-east-1a"
  storage_type = "gp3"
  storage_encrypted = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  skip_final_snapshot = true
}