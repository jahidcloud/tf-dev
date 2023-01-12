locals {
  api_services = [
    "sourcerepo.googleapis.com",
    "cloudbuild.googleapis.com",
    "run.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
  ]
}




locals {
  region           = var.region
  billing_account  = var.billing_account
  org_id           = var.org_id
  app_project_name = var.project_1_name
  app_project_id   = "${local.app_project_name}-${random_integer.int.result}"
  secondary_ip_ranges = {
    "pod-ip-range"      = "10.0.0.0/14",
    "services-ip-range" = "10.4.0.0/19"
  }
}