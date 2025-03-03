# terraform-azure-mcaf-pdns-zones
Terraform Module to create all privatelink dns zones

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Location used for the resource group and in some Private DNS Zones | `string` | n/a | yes |
| <a name="input_shortlocation"></a> [shortlocation](#input\_shortlocation) | shortcode of the location used in some Private DNS Zones | `string` | n/a | yes |
| <a name="input_additional_zones"></a> [additional\_zones](#input\_additional\_zones) | Additional Private DNS Zones to create | `list(string)` | `[]` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group in which to create the resources. | <pre>object({<br>    name = string<br>  })</pre> | <pre>{<br>  "name": null<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | The ID of the virtual network to link the Private DNS Zones to | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_zones"></a> [private\_dns\_zones](#output\_private\_dns\_zones) | object with all created Private DNS Zones |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | ID of the Resource Group created by the module |
<!-- END_TF_DOCS -->