terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = var.profile
  region = var.region
}

data "aws_caller_identity" "current" {}

resource "aws_cloudwatch_log_group" "sypi" {
  name = var.log_group
}
