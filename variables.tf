variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "os_type" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "app_service_environment_id" {
  type    = string
  default = null
}

variable "maximum_elastic_worker_count" {
  type    = number
  default = 1
}

/*
variable "worker_count" {
  type = number
  default = null
}
*/

variable "per_site_scaling_enabled" {
  type    = bool
  default = false
}


variable "zone_balancing_enabled" {
  type    = string
  default = false
}

variable "tags" {
  description = "A map of tags to set on every taggable resources. Empty by default."
  type        = map(string)
  default     = {}
}

variable "azure_ad_groups" {
  type    = list(string)
  default = []
}