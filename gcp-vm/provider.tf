//terraform {
//  required_providers {
//    google = {
//      source  = "hashicorp/google"
//      version = "~> 3.65"
//    }
//  }
//}





provider "google" {

  credentials = (file("~/focal-psyche-322421-bd3d0abf207e.json"))

  project = "focal-psyche-322421"
  region  = "us-central1"
  zone    = "us-central1-a"
}


