# terraform-aws-static-website-hosting
terraform-aws-static-website-hosting

S3 will be private
No public access enabled
Object versioning enabled
Encrypt bucket with SSE-KMS CMK 

Upload index.html for testing, but need to be done in CI/CD for best practices

Add S3 permissions - to make sure with least privilege
Only Specific Cloudfront with ARN will be able to access this specific bucket using Bucket ARN inside policy

Will be using Origin Access Control (OAC) as a modern approach for connecting from Cloudfront to S3
This will be more secure than ACL

Define price class in variables

Whitelist only these regions, best production method

Use default certificate from Cloudfront

Also make sure to have least methods allowed in cloudfront behaviors (No PUT, DELETE as this is static website hosting)

Keep the bucket name same as origin, and specific bucket name as origin id inside cloudfront

Add S3 permission - cloudfront to access the s3 through get object

Add missing permission - Enable Cloudfront to access KMS Key to decrypt the bucket and its objects

Add output variables

Usage
```
module "static_website_hosting" {
  source = "git::https://github.com/nagarajurahul/terraform-aws-static-website-hosting.git?ref=v0.0.1"

  # Region to host the static website
  region = "us-east-2"

  # Bucket name of the s3 origin for hosting static website
  # Please make sure you match with your origin name
  # In future, there will be upgrades with creating dns names and certs for the same origin name
  s3_bucket_name = "unique-my-static-website-hosting-by-your-name.com"

  # Tags to be attached with all resources
  tags = { "env" = "production", "purpose" = "static-website-hosting" }

  # Default root object for home page
  default_root_object = "index.html"
}
```