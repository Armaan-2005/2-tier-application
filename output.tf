output "load_balancer_dns" {
  value = "http://${module.alb.alb_dns_name}"
}