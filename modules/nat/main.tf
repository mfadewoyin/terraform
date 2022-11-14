/* NAT */
resource "aws_nat_gateway" "main" {
  
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id
  #depends_on    = [aws_internet_gateway.main]
  tags = {
    Name        = var.tag_name
    Environment = var.tag_environment
  }
}
