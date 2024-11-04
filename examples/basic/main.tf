terraform {
  required_version = ">= 1.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4"
    }
  }
}

provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  features {}
}

module "private_dns_zones" {
  source = "../.."

  resource_group = {
    name = "example-rg"
  }

  location      = "West Europe"
  shortlocation = "weu"

  # some sql database types need a dedicated DNS zone, supply them in a seperate list, i.e.
  additional_zones = ["privatelink.a1b2c3d4e5f6.database.windows.net"]
}
