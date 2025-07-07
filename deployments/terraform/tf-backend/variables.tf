variable "resource_group_name" {
  type = string
  default = "rg-tfstate"
}

variable "location" {
  type = string
  default = "polandcentral" 
}

variable "storage_account_name_backend" {
  type = string
  default = "stdailyquotetfstate"
}

variable "storage_account_tier" {
  type = string 
  default = "Standard"
}

variable "storage_account_replication_type" {
  type = string 
  default = "LRS"
}

variable "storage_container_name_backend" {
    type    = string
    default = "tfstate"
}

variable "container_access_type" {
    type    = string
    default = "blob"
}