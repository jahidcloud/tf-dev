module "vpc" {
  source = "./path/to/module/directory"

  vpc_name                  = "jahid-dev-vpc"
  auto_create_subnetworks   = true

  }
