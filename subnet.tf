# management subnet
resource "google_compute_subnetwork" "management" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.my_vpc.id
  region        = "us-central1"
  routing_mode  = "REGIONAL"
}

# restricted subnet
resource "google_compute_subnetwork" "restricted" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.2.0/24"
  network       = google_compute_network.my_vpc.id
  region        = "us-central1"
  routing_mode  = "REGIONAL"
  access_config {
    public_ip = "none"
  }
}
