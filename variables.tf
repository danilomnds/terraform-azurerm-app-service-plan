variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "kind" {
  type = string
  default = "Windows"
}

variable "maximum_elastic_worker_count" {
  type = number
  default = null
}

variable "sku" {
  type = object({
    tier = string
    size = string
    capacity = optional(number)
  })
  default = null
}

variable "app_service_environment_id" {
  type = string
  default = null
}

/*
variable "reserved" {
  type = string
  default = null
}
*/

/* check what's the default value
variable "per_site_scaling" {
  type = bool
  default = null
}
*/

/* check whats the default value
variable "is_xenon" {
  type = bool
  default = null
}
*/

/*
variable "zone_redundant" {
  type = string
  default = null
}
*/

variable "tags" {
  description = "A map of tags to set on every taggable resources. Empty by default."
  type        = map(string)
  default     = {}
}

variable "azure_ad_groups" {
  type    = list(string)
  default = []
}