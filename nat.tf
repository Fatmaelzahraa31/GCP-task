resource "google_compute_router" "my_router" {
  name            = "my-router"
  network         = google_compute_network.my_vpc.id
  region          = "us-central1"
}

resource "google_compute_router_nat" "my_router_nat" {
  name                     = "my-router-nat"
  router                   = google_compute_router.my_router.id
  region                   = "us-central1"
  subnetwork               = google_compute_subnetwork.management.id
  nat_ip_allocate_option   = "AUTO"
}