
resource "google_compute_firewall" "public_ssh" {
  name          = "public-ssh"
  network       = google_compute_network.main.self_link
  project       = local.app_project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-access"]
    log_config{
        metadata = "INCLUDE_ALL_METADATA"
    }
}


resource "google_compute_firewall" "deny_ssh" {
  name          = "deny-ssh"
  network       = google_compute_network.main.self_link
  project       = local.app_project_id

  deny {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction     = "INGRESS"
  source_ranges = ["81.111.118.167"]
  target_tags   = ["deny-ssh-access"]
    log_config{
        metadata = "INCLUDE_ALL_METADATA"
    }
}


