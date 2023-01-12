provider "google" {
  project = var.project_id
  region  = var.region

}




# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer
resource "random_integer" "int" {
  min = 100
  max = 1000000
}