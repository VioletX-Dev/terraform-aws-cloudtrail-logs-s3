resource "aws_cloudtrail" "trail" {
  name                          = local.trail_name
  s3_bucket_name                = aws_s3_bucket.log_bucket.id
  s3_key_prefix                 = "all-logs"
  include_global_service_events = true

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::Lambda::Function"
      values = ["arn:aws:lambda"]
    }
  }
  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3"]
    }
  }

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}
