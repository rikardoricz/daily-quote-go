# Network module

This module creates a network security group (NSG), a virtual network (VNET) and a subnet

## Usage

```tf
module "network" {
  source                  = "../../modules/network"
  resource_group_name     = "resource-group-name"
  location                = "polandcentral"
  nsg_name                = "nsg-name"
  vnet_name               = "vnet-name"
  subnet_name             = "snet-name"
  address_space           = ["10.0.0.0/16"]
  subnet_address_prefixes = ["10.0.1.0/24"]

  tags = {
    "environment" = "dev"
  }
}
```

## Inputs

- `resource_group_name`
- `tags`
- `location` 
- `nsg_name` 
- `vnet_name`
- `address_space` 
- `subnet_name` 
- `subnet_address_prefixes` 


## Outputs

 - `vnet_id` - id of the virtual network
 - `subnet_id` - id of the subnet