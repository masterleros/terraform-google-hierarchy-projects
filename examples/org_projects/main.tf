################################ ATTENTION ################################
# Ensure that the "cloudresourcemanager.googleapis.com" is enabled in
# the Service Account project, else request will give a 403 HTTP error
################################ ATTENTION ################################

# Get the OAuth2 Token to execute the requests
data "google_client_config" "current" {}

# Request the projects for the specific parent
module "hierarchy_projects" {
  # source       = "github.com/masterleros/terraform-google-hierarchy-projects"
  source       = "../../"
  access_token = data.google_client_config.current.access_token
  parent_id    = var.parent_id
  # billing_info = true
  # label_filter = { key = "env", value = "nonprod" }
  # depth = 0
}
