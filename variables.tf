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

variable "parent_id" {
  description = "Parent ID where projects ID will be get (example: folders/<NUM>; organizations/<NUM>)"
  type        = string
  validation {
    condition     = can(regex("organizations|folders", split("/", var.parent_id)[0]))
    error_message = "The parent_id must follow the following formats: 'organizations/<NUM>' or 'folders/<NUM>'."
  }
}

variable "depth" {
  description = "How many sub-folder levels will be included (max: 10)"
  type        = number
  default     = 10
}

variable "label_filter" {
  description = "Filter labels"
  type        = object({ key = string, value = string })
  default     = null
}

variable "access_token" {
  description = "GCP Access Token"
  type        = string
}
