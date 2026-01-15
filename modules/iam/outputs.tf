output "cloud_run_service_account_email" {
  value = google_service_account.cloud_run.email
}

output "firestore_service_account_email" {
  value = google_service_account.firestore.email
}
