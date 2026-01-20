resource "google_cloud_run_service" "eqx-back" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image_url
        env {
          name  = "SECRET_KEY"
          value = var.secret_key
        }
        env {
          name  = "JWT_ALGORITHM"
          value = var.jwt_algorithm
        }
        ports {
          name           = "http1"
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "noauth" {
  service  = google_cloud_run_service.eqx-back.name
  location = google_cloud_run_service.eqx-back.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "url" {
  value = google_cloud_run_service.eqx-back.status[0].url
}
