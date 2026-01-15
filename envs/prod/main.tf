terraform {
  required_version = ">= 1.0.0"
  backend "gcs" {}
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "cloud_run" {
  source       = "../../modules/cloud_run"
  service_name = var.service_name
  region       = var.region
  image_url    = var.image_url
}

output "cloud_run_url" {
  value = module.cloud_run.url
}
