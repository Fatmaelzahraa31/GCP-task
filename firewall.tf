resource "google_compute_firewall" "firewall_allow" {
  name        = "firewall-allow"
  project     = "fatma120d"
  network     = google_compute_network.my_vpc.id
  direction   = "INGRESS"
  priority    = 1000
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}