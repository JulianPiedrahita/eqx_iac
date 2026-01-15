output "firebase_project_id" {
  description = "Firebase project ID"
  value       = google_firebase_project.default.project
}

output "firebase_database_instance_name" {
  description = "Firebase database instance name"
  value       = google_firebase_database_instance.default.name
}
