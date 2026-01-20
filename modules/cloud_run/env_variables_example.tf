# Ejemplo de variables de entorno para Cloud Run
resource "google_cloud_run_service" "example" {
  name     = "example-service"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/example/image"
        env = [
          {
            name  = "ENV_VAR_1"
            value = "value1"
          },
          {
            name  = "ENV_VAR_2"
            value = "value2"
          }
        ]
      }
    }
  }
}
