# https://registry.terraform.io/providers/-/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "s3" {
  bucket = var.s3_bucket_name

  tags = {
    Name = var.s3_bucket_name
  }
}

# https://registry.terraform.io/providers/-/aws/latest/docs/resources/s3_bucket_public_access_block
resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
