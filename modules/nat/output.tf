output "nat_gateway_id" {
  value       = aws_nat_gateway.main.id
  description = "The ID of the Nat Gateway"
}
