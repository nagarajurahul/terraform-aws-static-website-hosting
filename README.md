# terraform-aws-static-website-hosting

A production-ready Terraform module to deploy a **secure static website** using:

- Amazon S3 (Private)
- Amazon CloudFront (HTTPS)
- Origin Access Control (OAC)
- SSE-KMS with Customer Managed Key (CMK)
- Least-Privilege IAM Policies

This module follows modern AWS security best practices and is suitable for production-grade environments.

---

## 📦 Module Usage

```hcl
module "static_website_hosting" {
  source = "git::https://github.com/nagarajurahul/terraform-aws-static-website-hosting.git?ref=v1.0.0"

  region = "us-east-2"

  s3_bucket_name = "unique-my-static-website-hosting-by-your-name.com"

  tags = {
    env     = "production"
    purpose = "static-website-hosting"
  }

  default_root_object = "index.html"
}
```

---

## 🚀 Features

- 🔒 Private S3 bucket (no public access)
- 🔐 SSE-KMS encryption using Customer Managed Key
- 📦 Object versioning enabled
- 🌐 CloudFront distribution with HTTPS
- 🛡 Origin Access Control (OAC) — modern replacement for OAI
- 🔑 Least-privilege S3 bucket policy scoped to CloudFront ARN
- 🔑 KMS policy scoped to CloudFront distribution
- 🌍 Geo restriction (whitelist: US, CA)
- ⚡ Minimal HTTP methods (GET, HEAD only)
- 📤 Useful output variables

---

## 🏗 Architecture

---

## 🔐 Security Design

### S3

- Public access fully blocked
- Versioning enabled
- Encrypted with SSE-KMS (Customer Managed Key)
- Bucket policy restricted to specific CloudFront distribution

### CloudFront

- HTTPS enforced (`redirect-to-https`)
- Only GET and HEAD methods allowed
- Uses Origin Access Control (OAC)
- Default CloudFront certificate
- Geo restriction whitelist

### KMS

- Customer-managed key
- Key rotation enabled
- Access restricted using `AWS:SourceArn` condition

---

