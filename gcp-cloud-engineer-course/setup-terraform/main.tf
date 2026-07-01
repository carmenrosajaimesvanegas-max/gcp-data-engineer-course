terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "astral-archive-501113-v0"
  region  = "us-central1"
}

resource "google_project_service" "apis" {
  for_each = toset(["compute.googleapis.com", "container.googleapis.com", "cloudresourcemanager.googleapis.com"])
  service  = each.key
  disable_on_destroy = false
}
