provider "azurerm" {
  version = "=2.5.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}


data "azurerm_virtual_network" "example" {
  name                = var.network_name
  resource_group_name = var.group_name
}

data "azurerm_subnet" "example" {
  name                    =  data.azurerm_virtual_network.example.subnets.0
  virtual_network_name    =  var.network_name
  resource_group_name     =  var.group_name
}

output "virtual_network_location" {
  value = data.azurerm_virtual_network.example.location
}

output "virtual_network_subnets" {
  value = data.azurerm_virtual_network.example.subnets.0
}

output "subnet_id" {
  value = data.azurerm_subnet.example.id
}