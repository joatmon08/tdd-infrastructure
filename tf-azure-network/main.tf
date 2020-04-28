terraform {
  required_version = "~>0.12"
  backend "remote" {}
}

provider "azurerm" {
  version = "~> 2.7"
  features {}
}