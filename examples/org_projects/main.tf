################################ ATTENTION ################################
# Ensure that the "cloudresourcemanager.googleapis.com" is enabled in
# the Service Account project, else request will give a 403 HTTP error
################################ ATTENTION ################################

# Create a OAuth2 Token to execute the requests
data "google_service_account_access_token" "request_sa" {
  target_service_account = var.request_sa
  scopes                 = ["cloud-platform"]
  lifetime               = "120s"
}

# Request the projects for the specific parent
module "hierarchy_projects" {
  source       = "github.com/masterleros/terraform-google-hierarchy-projects"
  access_token = data.google_service_account_access_token.request_sa.access_token
  parent_id    = var.parent_id
  # label_filter = { key = "env", value = "nonprod" }
  # depth = 0
}
