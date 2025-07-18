module "resource_group" {
  source   = "../../modules/global"
  name     = var.rg_name
  location = var.location
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  nsg_name            = "nsg-aks-dev"
  vnet_name           = "vnet-aks-dev"
  # subnet_name         = "snet-aks-dev"
  # address_space       = ["10.1.0.0/16"]
  # dns_servers         = ["10.0.0.4", "10.0.0.5"]
  # subnet_address_prefixes = ["10.0.0.0/24"]

  tags       = var.tags
  depends_on = [module.resource_group]
}

module "acr" {
  source              = "../../modules/acr"
  resource_group_name = var.rg_name
  location            = var.location
  acr_name            = "acrdevdailyquote"
  acr_sku             = "Standard"

  tags       = var.tags
  depends_on = [module.resource_group]
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
  os_disk_size_gb        = 30
  subnet_id              = module.network.subnet1_id
  aks_nrg_name           = "nrg-dev-dailyquote"

  tags       = var.tags
  depends_on = [module.network]
}

# role assignment for aks acr pull
resource "azurerm_role_assignment" "example" {
  principal_id                     = module.aks.aks_kubelet_identity_object_id
  role_definition_name             = "AcrPull"
  scope                            = module.acr.acr_id
  skip_service_principal_aad_check = true
}

module "helm" {
  source     = "../../modules/helm"
  depends_on = [module.aks]
}
