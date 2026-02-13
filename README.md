# terraform-aws-static-website-hosting
terraform-aws-static-website-hosting

S3 will be private
No public access enabled
Object versioning enabled
Encrypt bucket with SSE-KMS CMK 

Upload index.html for testing, but need to be done in CI/CD for best practices

Add S3 permissions - to make sure with least privilege
Only Specific Cloudfront with ARN will be able to access this specific bucket using Bucket ARN inside policy