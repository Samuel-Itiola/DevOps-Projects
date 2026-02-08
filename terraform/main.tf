data "google_container_engine_versions" "default" {
  location = var.region
}

data "google_client_config" "current" {

}

resource "google_container_cluster" "default" {
    name = "my-first-cluster"
    location = var.region
    initial_node_count = 3
    min_master_version = data.google_container_engine_versions.default.latest_master_version
    deletion_protection = false
    node_config {
      machine_type = "e2-small"
      disk_size_gb = 32
    }

    provisioner "local-exec" {
      when = destroy
      command = "sleep 90"
    }
  
}