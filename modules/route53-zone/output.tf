output "route53_zone_id" {
  value       = aws_route53_zone.main.id
  description = "The ID of the VPC"
}
