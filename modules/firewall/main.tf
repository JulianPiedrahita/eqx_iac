resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}
