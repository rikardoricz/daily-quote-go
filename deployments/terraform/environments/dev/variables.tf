variable "rg_name" {
  type    = string
  default = "rg-dev-dailyquote"
}

variable "location" {
  type    = string
  default = "polandcentral"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    terraform   = "true"
  }
}