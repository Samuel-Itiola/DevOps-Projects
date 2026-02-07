terraform {
  required_version = ">=1.3"
  backend "gcs" {
    
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}

provider "google" {
    project = var.project_id
    region  = var.region
  
}

provider "kubernetes" {
  host = google_container_cluster.default.endpoint
  token = data.google_client_config.current.access_token
  client_certificate = base64decode(google_container_cluster.default.master_auth[0].client_certificate)
  client_key = base64decode(google_container_cluster.default.master_auth[0].client_key) 
  cluster_ca_certificate = base64decode(google_container_cluster.default.master_auth[0].cluster_ca_certificate)
  
}