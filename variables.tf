variable "region" {
  description = "Specifiy region where you wanna host static website"
  type        = string

}

variable "s3_bucket_name" {
  description = "S3 bucket name for hosting the index file"
  type        = string
}

variable "tags" {
  description = "Default tags to apply for all resources"
  type        = map(string)

  default = {
    "env"     = "production"
    "purpose" = "static-website-hosting"
  }
}