/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id

  tags = {
    Name        = var.tag_name
    Environment = var.tag_environment
  }
}