terraform {
  backend "gcs" {
    bucket  = "<REEMPLAZAR_BUCKET_TFSTATE>"
    prefix  = "prod/terraform/state"
  }
}
