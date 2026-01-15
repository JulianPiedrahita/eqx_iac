variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "service_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "image_url" {
  description = "Container image URL"
  type        = string
}

variable "secret_key" {
  description = "Secret key for JWT (env var SECRET_KEY)"
  type        = string
  sensitive   = true
}

variable "jwt_algorithm" {
  description = "JWT algorithm (env var JWT_ALGORITHM)"
  type        = string
  default     = "HS256"
}
