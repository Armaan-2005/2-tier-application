output "ec2_secuirty_id" {
  value = aws_security_group.ec2_sg.id
}
output "rds_secuirty_id" {
  value = aws_security_group.rds-sg.id
}