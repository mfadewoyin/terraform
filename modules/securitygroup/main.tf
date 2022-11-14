/*==== VPC's Default Security Group ======*/
resource "aws_security_group" "main" {
  name        = var.security_group_name
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = var.vpc_id
  #depends_on  = [aws_vpc.main]

  ingress=[
     {
    cidr_blocks = ["0.0.0.0/0"]     
    from_port = "80"
    to_port   = "80"
    protocol  = "tcp"
    self      = false
    description= "HTTP"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []

     },
     {
    cidr_blocks= ["0.0.0.0/0"]    
    from_port = "443"
    to_port   = "443"
    protocol  = "tcp"
    self      = false
    description= "HTTPS"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
  }
  ]
  
  egress {
    cidr_blocks= ["0.0.0.0/0"]
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = false
    description      = "for all outgoing traffics"
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    security_groups = []
  }
  tags = {
    Environment =var.tag_environment
  }
}