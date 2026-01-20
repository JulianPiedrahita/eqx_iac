resource "google_secret_manager_secret" "example" {
  secret_id = "example-secret"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "example" {
  secret      = google_secret_manager_secret.example.id
  secret_data = "example-value"
}
