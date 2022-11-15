

resource "aws_route53_record" "main" {
    name    = var.route53_zone_name
    type    = var.type
    zone_id = var.route53_zone_id
    ttl = 300
   # records = var.route53_record
}
