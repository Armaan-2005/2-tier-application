output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "pub_subnet_a_id" {
  value = aws_subnet.pub_subnet_a.id
}
output "priv_subnet_a_id" {
  value = aws_subnet.priv_subnet_a.id
}
output "pub_subnet_b_id" {
  value = aws_subnet.pub_subnet_b.id
}
output "priv_subnet_b_id" {
  value = aws_subnet.priv_subnet_b.id
}
output "key_name" {
  value = aws_key_pair.key_pair.key_name
}
output "az_a" {
  value = aws_subnet.pub_subnet_a.availability_zone
}
output "az_b" {
  value = aws_subnet.pub_subnet_b.availability_zone
}