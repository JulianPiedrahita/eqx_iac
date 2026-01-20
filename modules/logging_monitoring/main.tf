resource "google_logging_project_sink" "example" {
  name        = "example-sink"
  destination = "storage.googleapis.com/example-bucket"
  filter      = "resource.type=cloud_run_revision"
}

resource "google_monitoring_alert_policy" "example" {
  display_name = "High error rate"
  combiner     = "OR"
  conditions {
    display_name = "Error rate condition"
    condition_threshold {
      filter          = "metric.type=run.googleapis.com/request_count"
      comparison      = "COMPARISON_GT"
      threshold_value = 100
      duration        = "60s"
      trigger {
        count = 1
      }
    }
  }
}
