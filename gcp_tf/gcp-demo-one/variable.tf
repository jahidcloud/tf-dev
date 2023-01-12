variable "project" {
  default = "third-faculty-332019"
}
variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-b"
}

variable "ce_zone" {
  default = "us-central1-d"
}

# VPC INFO
variable "vnet_name" {
  default = "demo-vpc"
}

variable "subnet-02_cidr" {
  default = "192.168.0.0/16"
}

# SUBNET INFO
variable "subnet_name" {
  default = "demo-subnet"
}

variable "subnet_cidr" {
  default = "192.168.10.0/24"
}
variable "firewall_name" {
  default = "demo-fw"
}


variable "OS_admin" {
  description = "the selected ami based OS"
  default     = "CENTOS7"
}

variable "OS_TYPE" {
  description = "the selected ami based OS"
  default     = "CENTOS7"
}



variable "os_image_type" {

  default = {
    CENTOS7 = {
      name = "centos-cloud/centos-7"
    },

    RHEL7 = {
      name = "rhel_cloud/rhel-7"
    },

    UBUNTU = {
      name = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
}