output "image_id" {
  value = var.ubuntu 
}
output "inst_type" {
  value = var.inst_type
}
output "ec2_1a_id" {
  value = aws_instance.ec2_a.id
}
output "ec2_1b_id" {
  value = aws_instance.ec2_b.id
}