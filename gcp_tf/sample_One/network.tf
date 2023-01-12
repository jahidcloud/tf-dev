
resource "google_compute_network" "main" {
  project                 = local.app_project_id
  name                    = "app-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}


resource "google_compute_subnetwork" "demo_subnet" {
  name                     = "app-project-subnet"
  project                  = local.app_project_id
  ip_cidr_range            = var.subnet1_cidr
  region                   = var.region
  network                  = google_compute_network.main.id
  private_ip_google_access = "true"
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

}