# See https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html
data "aws_iam_policy_document" "origin_bucket_policy" {
  statement {
    sid    = "AllowCloudFrontServicePrincipalRead"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    # Make sure you have most minimal permissions here
    actions = [
      "s3:GetObject"
    ]
    # Specific S3 bucket
    resources = [
      "${aws_s3_bucket.s3.arn}/*",
    ]

    # Specific Cloudfront resource
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values = [""]
      # Change to this below value, after creating resource
      # values   = [aws_cloudfront_distribution.s3_distribution.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3.bucket
  policy = data.aws_iam_policy_document.origin_bucket_policy.json
}
