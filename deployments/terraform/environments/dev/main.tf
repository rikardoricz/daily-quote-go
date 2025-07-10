module "resource_group" {
  source   = "../../modules/global"
  name     = var.rg_name
  location = var.location
}

module "network" {
  source                  = "../../modules/network"
  resource_group_name     = module.resource_group.name
  location                = module.resource_group.location
  nsg_name                = "nsg-aks-dev"
  vnet_name               = "vnet-aks-dev"
  subnet_name             = "snet-aks-dev"
  address_space           = ["10.0.0.0/16"]
  subnet_address_prefixes = ["10.0.1.0/24"]

  tags = var.tags
}

module "aks" {
  source                 = "../../modules/aks"
  resource_group_name    = module.resource_group.name
  location               = module.resource_group.location
  aks_name               = "aks-dev-dailyquote"
  dns_prefix             = "exampledns1"
  default_node_pool_name = "default"
  node_count             = 1
  vm_size                = "Standard_B2ls_v2"

  acr_name = "acrdevdailyquote"
  acr_sku  = "Standard"

  tags = var.tags
}
