resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "bucketacl" {
  bucket = var.bucket_name
  acl    = var.acl
}

resource "aws_s3_bucket_website_configuration" "webhosting" {
  bucket = aws_s3_bucket.mybucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.mybucket.bucket
  key          = "index.html" # name of object
  source       = "index.html" # path of index file
  content_type = "text/html"
  etag         = md5(file("index.html")) #  check if file is changed
  acl          = "public-read"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.mybucket.bucket
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
  etag         = md5(file("error.html"))
  acl          = "public-read"
}