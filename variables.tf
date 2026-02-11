variable "region" {
  description = "Specifiy region where you wanna host static website"
  type        = string

}

variable "s3_bucket_name" {
  description = "S3 bucket name for hosting the index file"
  type        = string
}