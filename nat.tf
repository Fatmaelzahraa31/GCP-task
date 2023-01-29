resource "google_compute_router" "my_router" {
  name            = "my-router"
  network         = google_compute_network.my_vpc.id
  region          = "us-central1"
}

resource "google_compute_router_nat" "my_router_nat" {
  name                     = "my-router-nat"
  router                   = google_compute_router.my_router.name
  region                   = "us-central1"
  nat_ip_allocate_option   = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name = google_compute_subnetwork.management.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
   
}