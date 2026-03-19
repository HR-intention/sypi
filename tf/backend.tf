# Configure Terraform backend with S3 for state storage
terraform {
  backend "s3" {
    bucket  = "sypi-terraform-state" # Pre-create this S3 bucket for state storage
    key     = "sypi.tfstate"    # Path for the state file
    region  = "ap-south-1"               # S3 bucket region
    profile = "symplora-prod"            # AWS profile (configure in ~/.aws/credentials)
  }
}

