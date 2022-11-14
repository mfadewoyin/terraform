/* Elastic IP for NAT */
resource "aws_eip" "main" {
  vpc        = var.vpc
 # depends_on = [aws_internet_gateway.main]
}