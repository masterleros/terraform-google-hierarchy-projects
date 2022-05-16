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

output "projects" {
  description = "List of projects found (and optionally filtered) within the provided parent."
  value = { for p in flatten([for f in data.http.projects : [for v in lookup(jsondecode(f.body), "projects", []) : v]]) :
    (p.projectId) => merge(
      { for k, v in p : k => v if length(regexall("projectId", k)) == 0 },
      { projectNumber = split("/", p.name)[1] },
      var.billing_info ? { for k, v in jsondecode(data.http.project_billing[p.projectId].body) : k => v if contains(["billingAccountName", "billingEnabled"], k) } : {}
    )
    if contains(local.filtered_project_ids, p.projectId)
  }
}
