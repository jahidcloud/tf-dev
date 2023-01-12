variable "vpc_cidr" {
  type = string
  description = "The CIDR of the VPC."
}

variable "instance_tenancy" {
  type = string 
}

variable "enable_dns_support" {
  type = string
}