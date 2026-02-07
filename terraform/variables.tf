variable "project_id" {
  type        = string
  description = "GCP project ID"
}
variable "region" {
  type        = string
  description = "GCP region for resources"
}
variable "container_image" {
  type        = string
  description = "Full container image URL in Artifact Registry"
}
