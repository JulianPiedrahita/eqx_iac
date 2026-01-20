terraform {
  required_version = ">= 1.0.0"
  backend "gcs" {}
}

provider "google" {
  project = var.project_id
  region  = var.region
}


module "firebase" {
  source     = "../../modules/firebase"
  project_id = var.project_id
  region     = var.region
}

module "cloud_run" {
  source        = "../../modules/cloud_run"
  service_name  = var.service_name
  region        = var.region
  image_url     = var.image_url
  secret_key    = var.secret_key
  jwt_algorithm = var.jwt_algorithm
}

module "iam" {
  source     = "../../modules/iam"
  project_id = var.project_id
}

module "secret_manager" {
  source     = "../../modules/secret_manager"
}

module "logging_monitoring" {
  source     = "../../modules/logging_monitoring"
}

module "firewall" {
  source     = "../../modules/firewall"
}

module "smoke_test" {
  source     = "../../modules/smoke_test"
}

output "cloud_run_url" {
  value = module.cloud_run.url
}

output "firebase_project_id" {
  value = module.firebase.firebase_project_id
}

output "firebase_database_instance_name" {
  value = module.firebase.firebase_database_instance_name
}
