# AKS module

This module provisions AKS and ACR

## Usage

```tf
module "aks" {
  source                 = "../../modules/aks"
  resource_group_name    = "rg-name
  location               = "polandcentral
  aks_name               = "aks-name"
  dns_prefix             = "exampledns1"
  default_node_pool_name = "default"
  node_count             = 1
  vm_size                = "Standard_B2ls_v2"

  acr_name = "acrname"
  acr_sku  = "Standard"

  tags = {
    "environment" = "dev"
  }
}
```

## Inputs

## Outputs