provider "aws" {
  version = "2.12.0"
  region  = var.aws_region
}

terraform {
  required_version = ">= 0.12"
}

