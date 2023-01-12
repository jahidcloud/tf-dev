resource "google_compute_network" "example" {
  name                     = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
}
