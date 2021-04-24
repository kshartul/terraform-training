provider "azurerm" {
  version = "=2.5.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {} # required to customize behavior of some azure provider resources
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}