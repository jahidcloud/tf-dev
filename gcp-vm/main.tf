resource "google_compute_instance" "jahmed-vm" {
  name         = "jahmed-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {

    network = "default"

    access_config {}

  }

}









//resource "google_compute_network" "jahid_vpc" {
//  name = "terraform-network"
//}