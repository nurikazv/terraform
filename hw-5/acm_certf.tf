resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

 
  lifecycle {
    create_before_destroy = true
  }
}


data "aws_route53_zone" "route53-zone" {
  name         = "${chomp(var.domain_name)}."
  private_zone = false
}

resource "aws_route53_record" "route53-record" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.route53-zone.zone_id
}

resource "aws_acm_certificate_validation" "cert-valid" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.route53-record : record.fqdn]
}

resource "aws_route53_record" "alb_alias" {
  zone_id = data.aws_route53_zone.route53-zone.zone_id
  name    = var.domain_name
  type    = "A"
  allow_overwrite = true

  alias {
    name                   = aws_lb.app-lb.dns_name
    zone_id                = aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "alb_alias_ipv6" {
  zone_id = data.aws_route53_zone.route53-zone.zone_id
  name    = var.domain_name
  type    = "AAAA"
  allow_overwrite = true

  alias {
    name                   = aws_lb.app-lb.dns_name
    zone_id                = aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}