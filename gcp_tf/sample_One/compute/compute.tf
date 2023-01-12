resource "google_compute_instance" "app-vm" {
  name         = "app-vpc"
  project      = data.google_project.project_data.project_id
  zone         = var.zone
  machine_type = "e2-micro"


  network_interface {
    network    = data.google_compute_network.vpc_data.name
    subnetwork = data.google_compute_subnetwork.subnetwork_data.self_link
    //    subnetwork_project = local.app_project_id
    access_config {}
  }

  boot_disk {
    initialize_params {
      image = var.os_image_main
    }
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }

  tags = ["ssh-access", "deny-ssh-access"]

  # service account # Scope is legacy
  //  service_account {
  //    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  //  }

}