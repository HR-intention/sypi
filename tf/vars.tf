variable "package_bucket" {
  type = string
  default = "sypi-storage"
  description = "Name of the S3 bucket where pypi packages are to be stored"
}

variable "region" {
  type = string
  default = "ap-south-1"
}

variable "log_group" {
  type = string
  default = "sypi"
  description = "CloudWatch log group for access logs"
}

variable "profile" {
  type = string
  default = "symplora-prod"
}
