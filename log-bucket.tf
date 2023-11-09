resource "aws_s3_bucket" "log_bucket" {
  bucket        = "${var.company}-cloudtrail-logs"
  force_destroy = true

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}

resource "aws_s3_bucket_policy" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.id
  policy = data.aws_iam_policy_document.log_bucket.json
}
