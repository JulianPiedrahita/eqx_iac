terraform {
  required_version = ">= 1.0.0"
}

provider "google" {
  project = module.project.project_id
  region  = var.region
}

module "project" {
  source       = "../../modules/project"
  project_name = var.project_name
  project_id   = var.project_id
  org_id       = var.org_id
}

# Habilitar APIs necesarias
resource "google_project_service" "run" {
  project = var.project_id
  service = "run.googleapis.com"
}

resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}

resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
}

resource "google_project_service" "containerregistry" {
  project = var.project_id
  service = "containerregistry.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"
}

module "cloud_run" {
  source        = "../../modules/cloud_run"
  service_name  = var.service_name
  region        = var.region
  image_url     = var.image_url
  secret_key    = var.secret_key
  jwt_algorithm = var.jwt_algorithm
}

output "cloud_run_url" {
  value = module.cloud_run.url
}

module "firebase" {
  source     = "../../modules/firebase"
  project_id = var.project_id
  region     = var.region
}

module "iam" {
  source     = "../../modules/iam"
  project_id = var.project_id
}

output "firebase_project_id" {
  value = module.firebase.firebase_project_id
}

output "firebase_database_instance_name" {
  value = module.firebase.firebase_database_instance_name
}
