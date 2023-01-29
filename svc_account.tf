# Create a Service Account
resource "google_service_account" "my_service_account" {
  account_id   = "my-service-account"
  project      = "fatma120d"
}

# Create a custom role
resource "google_project_iam_custom_role" "custom_role" {
  project = "fatma120d"
  role_id = "mycustomrole"
  title   = "my custom role"
  permissions = [ "compute.projects.get", "compute.instances.get", "resourcemanager.projects.get", "storage.buckets.get", "storage.buckets.list" , "storage.objects.get" , "storage.objects.list" , "container.deployments.get" , "container.deployments.create" , "container.deployments.list" , "container.services.list" , "container.services.get" , "container.services.create" , "container.clusters.list" , "container.clusters.getCredentials" , "container.clusters.get" , "container.pods.list" ,"container.nodes.list" ]
}

resource "google_project_iam_binding" "project_role_binding" {
  project = "fatma120d"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.my_service_account.email}"  
  ]

}

# Assign the custom role to the project
resource "google_project_iam_binding" "gke_service_account_iam_role" {
  project = "mohamed-abdelrazik-project"
  role    = "projects/${google_service_account.my_service_account.project}/roles/${google_project_iam_custom_role.custom-role.role_id}"
  members = [
    "serviceAccount:${google_service_account.my_service_account.email}"
  ]
}
