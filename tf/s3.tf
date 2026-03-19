resource "aws_s3_bucket" "sypi" {
  bucket = var.package_bucket
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "sypi" {
  bucket = aws_s3_bucket.sypi.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
