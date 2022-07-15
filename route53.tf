resource "aws_route53_zone" "hosted_zone" {
  name = var.bucket_name
}


resource "aws_route53_record" "hosted_zone_record" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = var.bucket_name
  type    = "A"
  alias {
    name                   = aws_s3_bucket.mybucket.website_domain
    zone_id                = aws_s3_bucket.mybucket.hosted_zone_id
    evaluate_target_health = true
  }
}
