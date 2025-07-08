variable "resource_group_name" {
  type    = string
  default = "rg-dev-dailyquote"
}

variable "location" {
  type    = string
  default = "polandcentral"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "acr_sku" {
  type    = string
  default = "Standard"
}

variable "acr_name" {
  type    = string
  default = "acrdevdailyquote"
}

variable "aks_name" {
  type    = string
  default = "aks-dev-dailyquote"
}