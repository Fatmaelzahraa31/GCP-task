resource "google_container_cluster" "my_cluster" {
  name               = "my-cluster"
  network            = google_compute_network.my_vpc.id
  subnetwork         = google_compute_subnetwork.management.id
  location           = "us-central1"
  remove_default_node_pool = true
  initial_node_count = 1

  # Set the cluster to private
  private_cluster_config {
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
    enable_private_nodes    = true
  }

  ip_allocation_policy {
    
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "10.0.1.0/24"
      display_name = "managment-cidr-range"
    }
  }
    addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }

  }

  release_channel {
    channel = "REGULAR"
  }
   node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    service_account = google_service_account.my_service_account.email
  }

}

resource "google_container_node_pool" "my_node_pool" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.my_cluster.name
  node_count = 1
  
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    preemptible  = true
    machine_type = "e2-micro"
    service_account = google_service_account.my_service_account.email
  }
}