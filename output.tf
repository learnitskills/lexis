output "bucket_output" {
  value = aws_s3_bucket.mybucket
}

output "zone_output" {
  value = aws_route53_zone.zone
}

output "s3_config_output" {
  value = aws_s3_bucket_website_configuration.webhosting
}
