

######################
# Firewalld
######################    
# web network tag


resource "google_compute_firewall" "web-server" {
  project     = data.google_client_config.current.project
  name        = "allow-http-rule"
  network     = google_compute_network.demo_vpc.name
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "443", "3389"]
  }

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
  timeouts {}
  log_config{ 
      metadata = "INCLUDE_ALL_METADATA"
      }
}

#resource "google_compute_firewall" "egress-test" {
#  name    = "egress-test"
#  network = google_compute_network.demo_vpc.self_link

#  deny {
#    protocol = "tcp"
#    ports    = ["80", "22", "443", "3389"]
#  }

#  direction = "EGRESS"
#  destination_ranges = ["0.0.0.0/0"]
#  target_tags = ["web-server"]
#}






output "project" {
  value = data.google_client_config.current.project
}

