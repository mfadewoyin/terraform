# Create a new load balancer
resource "aws_elb" "main" {
  name               = var.elb_name
  subnets = var.aws_subnet
  security_groups = var.security_groups
  
  listener =[
    {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  },
    {
    instance_port     = 443
    instance_protocol = "https"
    lb_port           = 443
    lb_protocol       = "https"
     #            Note about SSL:
      #            This line is commented out because ACM certificate has to be "Active" (validated and verified by AWS, but Route53 zone used in this example is not real).
      #            To enable SSL in ELB: uncomment this line, set "wait_for_validation = true" in ACM module and make sure that instance_protocol and lb_protocol are https or ssl.
      #            ssl_certificate_id = module.acm.acm_certificate_arn
  }
  ]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }


  tags = {
    Environment =var.tag_environment
  
  }
}
