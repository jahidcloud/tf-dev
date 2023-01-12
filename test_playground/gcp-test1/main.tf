provider "google" {
  project = "jahmed-dev-env"
  region  = "us-central1"
}


module "vpc" {
  source                  = "../../module/gcp_vpc_basic/"
  vpc_name                = "jahid-dev-vpc"
  auto_create_subnetworks = false
}

