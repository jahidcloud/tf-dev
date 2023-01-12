

resource "google_compute_instance" "demo-ce" {
  name         = "demo-vpc"
  project      = data.google_client_config.current.project
  zone         = var.zone
  machine_type = "e2-micro"

  metadata = {
    ssh-keys = "${var.OS_admin}:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    network            = google_compute_network.demo_vpc.self_link
    subnetwork         = google_compute_subnetwork.demo_subnet.self_link
    subnetwork_project = data.google_client_config.current.project
    access_config {}
  }

  boot_disk {
    initialize_params {
      image = var.os_image_type[var.OS_TYPE].name
    }
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }

  # service account
  service_account {
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
  tags = ["web-server"]
}



resource "google_compute_address" "internal_reserved_subnet_ip" {
  name         = "internal-address"
  subnetwork   = google_compute_subnetwork.demo_subnet.id
  address_type = "INTERNAL"
  region       = var.region

}



output "ip" {
  value = google_compute_instance.demo-ce.network_interface.0.access_config.0.nat_ip
}
