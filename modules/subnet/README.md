<!-- BEGIN_TF_DOCS -->
# Subnet Module
## Description
Creates a subnet and associates it with a provided list of Route Tables

### Notes
The reason this module doesn't create the route table for the subnet it's creating. This is for 2 reasons
1. You want to associate a single route table with many subnets
2. You want to associate multiple route tables with the subnet this module is creating

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The Availibility Zone to Assign to the Subnet | `string` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The CIDR Block assigned to the Subnet that's being created | `string` | n/a | yes |
| <a name="input_route_table_ids"></a> [route\_table\_ids](#input\_route\_table\_ids) | List of Route Table IDs to associate to the Subnet being created | `list(string)` | n/a | yes |
| <a name="input_subnet_iterator"></a> [subnet\_iterator](#input\_subnet\_iterator) | The index of the Subnet. When creating multiple subnets using the module, set this to 'count.index'. Otherwise set it to some other number (i.e. 0) | `number` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The display name of the AWS Subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to put on the resources created for this module | `map(any)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC the subnet is being created in | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The Name of the VPC the Subnet is being created in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet"></a> [subnet](#output\_subnet) | All attrbutes for the subnet created by the module |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | The CIDR Block of the Subnet |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the Subnet being created |

## Resources

| Name | Type |
|------|------|
| [aws_route_table_association.route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
<!-- END_TF_DOCS -->