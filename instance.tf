resource "google_compute_instance" "my_private_vm" {
  name         = "my-private-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  # Set the machine to be a private instance
  network_interface {
    network = google_compute_network.my_vpc.id
    subnetwork = google_compute_subnetwork.management.id
  }

  depends_on = [
    google_container_cluster.my_cluster ,
    google_container_node_pool.my_node_pool
  ]
  
  # Add the boot disk
  boot_disk {
    initialize_params {
      image = "my-image"
      size  = 30
    }
  }
  
  # Set Service Account with scopes 
  service_account {
    email = google_service_account.my_service_account.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform" ]
  }


}  
