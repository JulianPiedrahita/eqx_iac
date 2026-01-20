resource "google_firebase_project" "eqx" {
  provider = google-beta
  project  = var.project_id
}

resource "google_firebase_database_instance" "eqx-data-base" {
  provider = google-beta
  project  = var.project_id
  region   = var.region
  type     = "CLOUD_FIRESTORE"
}

output "firebase_project_id" {
  value = google_firebase_project.eqx-data-base.project
}

output "firebase_database_instance_name" {
  value = google_firebase_database_instance.eqx-data-base.name
}
