/* the subnet */
resource "aws_subnet" "main" {
  
  cidr_block           = var.subnet_cidr_block
  vpc_id               = var.vpc_id
  availability_zone    = var.subnet_availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch # This makes the subnet public

  tags = {
    Name = var.tag_name
    Environment = var.tag_environment
  }
}