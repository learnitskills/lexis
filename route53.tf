resource "aws_route53_zone" "zone" {
  name = var.bucket_name
}


resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.bucket_name
  type    = "A"
  alias {
    zone_id                = aws_s3_bucket.mybucket.hosted_zone_id
    name                   = aws_s3_bucket_website_configuration.webhosting.website_domain
    evaluate_target_health = true
  }
}
