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
  description = "Location used fir the resource group and in some Private DNS Zones"
  type        = string
}

variable "shortlocation" {
  description = "shortcode of the location to be used in some Private DNS Zones"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "additional_zones" {
  description = "Additional Private DNS zones to create"
  type        = list(string)
  default     = []
}