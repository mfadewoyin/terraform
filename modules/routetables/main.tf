/* Routing table for the  subnet */
resource "aws_route_table" "main" {
  vpc_id           = var.vpc_id

  tags = {
    Name        = var.tag_name
    Environment = var.tag_environment
  }
}