# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "index_file" {
  key        = "index.html"
  bucket     = aws_s3_bucket.s3.id
  source     = "index.html"
  kms_key_id = aws_kms_key.s3_cmk.arn

  content_type = "text/html"
}
