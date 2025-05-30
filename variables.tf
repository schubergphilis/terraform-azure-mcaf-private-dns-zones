variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
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

variable "virtual_network_id" {
  description = "The ID of the virtual network to link the Private DNS Zones to"
  type        = string
  default     = null
}

variable "query_zones" {
  description = "if set to true will query for created zones instead of creating them, used for creating vnet links"
  type        = bool
  default     = false
}
