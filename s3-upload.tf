# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
# This is best to do in CI/CD, as any new changes in html file wont trigger terraform apply again, as terraform doesnt track html files
resource "aws_s3_object" "index_file" {
  key        = "index.html"
  bucket     = aws_s3_bucket.s3.id
  source     = "index.html"
  kms_key_id = aws_kms_key.s3_cmk.arn

  content_type = "text/html"
}
