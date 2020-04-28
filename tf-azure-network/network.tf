locals {
  subnets = {
    frontend = cidrsubnet(var.cidr_block, 8, 0)
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "example" {
  count                = length(keys(local.subnets))
  name                 = keys(local.subnets)[count.index]
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefix       = local.subnets[keys(local.subnets)[count.index]]
}