output "s3_bucket_arn" {
  value = aws_s3_bucket.s3.arn
}

output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.s3.bucket_regional_domain_name
}

output "index_file_arn" {
  value = aws_s3_object.index_file.arn
}
