package main

deny[msg] {
  not input.resource.azurerm_virtual_network.example
  msg = "Define virtual network resource"
}

allow[msg] {
  not input.resource.azurerm_subnet.example
  msg = "Define subnet resource"
}

deny[msg] {
  vnet := input.resource.azurerm_virtual_network.example
  not contains(vnet.address_space[0], "${var.cidr_block}")
  msg = sprintf("virtual network defines CIDR block `%v`. use variables.", vnet.address_space)
}

deny[msg] {
  input.resource.azurerm_subnet.example.count != 2
  msg = sprintf("should have 2 subnets, got `%v`", [input.resource.azurerm_subnet.example.count])
}