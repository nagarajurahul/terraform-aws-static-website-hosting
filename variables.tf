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

variable "price_class" {
  description = "Price class for the cloudfront distribution"
  type        = string

  default = "PriceClass_100"
}

variable "default_root_object" {
  description = "Specifiy file name of the default root object"
  type = string

  default = "index.html"
}
