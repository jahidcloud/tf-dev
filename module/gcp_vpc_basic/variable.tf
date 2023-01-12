# variables.tf

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

# variables.tf

variable "auto_create_subnetworks" {
  type        = bool
  description = "Whether to automatically create subnetworks for the VPC"
}

