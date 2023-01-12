data "google_client_config" "current" {

}



resource "google_compute_network" "demo_vpc" {
  project                 = data.google_client_config.current.project
  name                    = "demo-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}



resource "google_compute_subnetwork" "demo_subnet" {
  name                     = "app-project-subnet"
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.demo_vpc.name
  private_ip_google_access = "true"
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

  secondary_ip_range {
    range_name    = "subnet-01-secondary-01"
    ip_cidr_range = "192.168.64.0/24"
  }


}