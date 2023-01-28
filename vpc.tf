resource "google_compute_network" "my_vpc" {
  name    = "my-vpc"
  project = "fatma120d"
  auto_create_subnetworks = false
}
