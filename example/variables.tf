variable "request_sa" {
  description = "Service Account used to create the HTTP request to Google Cloud (executing account must have 'roles/iam.serviceAccountTokenCreator' for the Service Account specified in this variable)"
  type        = string
}

variable "parent_id" {
  description = "Parent ID where projects ID will be get (example: folders/<NUM>; organizations/<NUM>)"
  type        = string
}
