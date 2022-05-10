#    Copyright 2022 Leonardo Andres Morales

#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0

#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

locals {
  request_headers = {
    Authorization = sensitive("Bearer ${var.access_token}")
    Accept        = "application/json"
  }

  # Collect all folder levels
  hierarchy_l1  = flatten([for f in data.http.l1_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l2  = flatten([for f in data.http.l2_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l3  = flatten([for f in data.http.l3_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l4  = flatten([for f in data.http.l4_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l5  = flatten([for f in data.http.l5_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l6  = flatten([for f in data.http.l6_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l7  = flatten([for f in data.http.l7_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l8  = flatten([for f in data.http.l8_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l9  = flatten([for f in data.http.l9_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])
  hierarchy_l10 = flatten([for f in data.http.l10_folders : [for v in lookup(jsondecode(f.body), "folders", []) : v.name]])

  # Collect all parents
  parents = concat([var.parent_id], local.hierarchy_l1, local.hierarchy_l2, local.hierarchy_l3, local.hierarchy_l4, local.hierarchy_l5, local.hierarchy_l6, local.hierarchy_l7, local.hierarchy_l8, local.hierarchy_l9, local.hierarchy_l10)

  # Collect all projects
  project_ids = flatten([for f in data.http.projects : [for v in lookup(jsondecode(f.body), "projects", []) : v.displayName]])
}

data "http" "l1_folders" {
  for_each        = var.depth > 0 ? toset([var.parent_id]) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l2_folders" {
  for_each        = var.depth > 1 ? toset(local.hierarchy_l1) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l3_folders" {
  for_each        = var.depth > 2 ? toset(local.hierarchy_l2) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l4_folders" {
  for_each        = var.depth > 3 ? toset(local.hierarchy_l3) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l5_folders" {
  for_each        = var.depth > 4 ? toset(local.hierarchy_l4) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l6_folders" {
  for_each        = var.depth > 5 ? toset(local.hierarchy_l5) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l7_folders" {
  for_each        = var.depth > 6 ? toset(local.hierarchy_l6) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l8_folders" {
  for_each        = var.depth > 7 ? toset(local.hierarchy_l7) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l9_folders" {
  for_each        = var.depth > 8 ? toset(local.hierarchy_l8) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "l10_folders" {
  for_each        = var.depth > 9 ? toset(local.hierarchy_l9) : []
  url             = "https://cloudresourcemanager.googleapis.com/v3/folders?parent=${each.key}&pageSize=1000"
  request_headers = local.request_headers
}

data "http" "projects" {
  for_each        = toset(local.parents)
  url             = "https://cloudresourcemanager.googleapis.com/v3/projects?parent=${each.key}&pageSize=500"
  request_headers = local.request_headers
}
