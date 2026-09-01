output "alb_id" {
  value = aws_alb.my-alb.id
}
output "alb_target_arn" {
 value=aws_lb_target_group.lb_target.arn
}
output "alb_name" {
  value = aws_alb.my-alb.name
}
output "alb_dns_name" {
  value = aws_alb.my-alb.dns_name
}
