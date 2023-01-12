output "vpc_name" {
  description = "The Name of the newly created vpc"
  value       = google_compute_network.demo_vpc.name
}
#output "vpc_id" {
#      description = "id of created vpc. "
#      value       = google_compute_network.terra_vpc.id
#    } 

output "Subnet_Name" {
  description = "Name of created vpc's Subnet. "
  value       = google_compute_subnetwork.demo_subnet.name
}
output "Subnet_id" {
  description = "id of created vpc. "
  value       = google_compute_subnetwork.demo_subnet.id
}
output "Subnet_CIDR" {
  description = "cidr block of vpc's Subnet. "
  value       = google_compute_subnetwork.demo_subnet.ip_cidr_range
}

output "firewall_Name" {
  description = "Security Group Name. "
  value       = google_compute_firewall.web-server.name
}

output "fire_wall_rules" {
  description = "Shows ingress rules of the Security group "
  value       = google_compute_firewall.web-server.allow
}

