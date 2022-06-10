variable "parent_id" {
  description = "Parent ID where projects ID will be get (example: folders/<NUM>; organizations/<NUM>)"
  type        = string
  validation {
    condition     = can(regex("organizations|folders", split("/", var.parent_id)[0]))
    error_message = "The parent_id must follow the following formats: 'organizations/<NUM>' or 'folders/<NUM>'."
  }
}
