data "google_compute_network" "vpc_data" {
  name                  = "app-vpc"
  //id                    = "application-project-uno-94610"
  project               = "application-project-uno-94610"
}



data "google_compute_subnetwork" "subnetwork_data" {
  name                       = "app-project-subnet"
  region                     = "us-central1"
  project                    = "application-project-uno-94610"
}



data "google_project" "project_data" {
    project_id             = "application-project-uno-94610"

}
