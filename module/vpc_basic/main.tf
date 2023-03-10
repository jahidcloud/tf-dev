# Internet VPC

resource "aws_vpc" "vpc-main" {
  cidr_block           = var.vpc_cidr    
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

}