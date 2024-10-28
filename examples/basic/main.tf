terraform {
  required_version = ">= 1.7"
}

module "private_dns_zones" {
  source = "../.."

  location      = "West Europe"
  shortlocation = "weu"
}
