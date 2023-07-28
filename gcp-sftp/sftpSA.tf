resource "google_service_account" "jahidsftp" { #### Service account
  account_id   = "jahidsftp-sa"
  display_name = "Service Account"
  project      = var.project_id
}



resource "google_project_iam_custom_role" "jahidsftp" { #### Custom GCP role where you can input the permission you desire.
  role_id     = "jahidsftp"
  title       = "My Custom Role"
  description = "A description of my custom role"
  project     = var.project_id
  permissions = ["storage.buckets.create", "storage.buckets.get", "compute.zones.get"]
}



resource "google_project_iam_member" "member" { ### Role binding of gcp custom iam role --> Service account
  project = var.project_id
  role    = "projects/${var.project_id}/roles/${google_project_iam_custom_role.jahidsftp.role_id}"
  member  = "serviceAccount:${google_service_account.jahidsftp.email}"
}


output "service_account_email" {
  description = "The email of the service account"
  value       = google_service_account.jahidsftp.email
}