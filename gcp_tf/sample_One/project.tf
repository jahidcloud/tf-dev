resource "google_project" "project_app" {
  name                = local.app_project_name
  project_id          = local.app_project_id
  billing_account     = var.billing_account
  org_id              = var.org_id
  auto_create_network = false
}





resource "google_project_service" "project" {
  for_each = toset(local.api_services)
  project  = google_project.project_app.number
  service  = each.key

  provisioner "local-exec" {
    command = "sleep 60"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "sleep 15"
  }
}