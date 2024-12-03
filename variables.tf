variable "resource_group" {
  description = "The name of the resource group in which to create the resources."
  type = object({
    name = string
  })
  default = {
    name = null
  }
  nullable = false
}

variable "location" {
  description = "Location used for the resource group and in some Private DNS Zones"
  type        = string
}

variable "shortlocation" {
  description = "shortcode of the location used in some Private DNS Zones"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "additional_zones" {
  description = "Additional Private DNS Zones to create"
  type        = list(string)
  default     = []
}