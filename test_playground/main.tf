provider "aws" {
  version = "2.12.0"
  region  = "eu-west-1"
}

terraform {
  required_version = ">= 0.12"
}

#module "vpc_basic" {
#    source = "../module/vpc_basic"
#
#    vpc_cidr  = "10.0.0.0/16"
#    instance_tenancy = "default"
#    enable_dns_support = "true"
#}

#module "s3-test" {
#  source = "../module/s3_v1"
#  name = "dev-test-bucket-01"
#}

#module "s3-iam" {
#  source = "../s3_iam_mod"
#  role_name   = "jahid-role" 
#  bucket_name = "jahid-data-pro-01"
#}



module "awseip" {
  source = "../terraform-fundamentals/all_count_example/count_ex2"
  eip_create = false
}

# this is an example on how to use conditional via count