provider "azurerm" {
  version = "=2.5.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "backend-rg"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name = "terraformshstorageacc"
  resource_group_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier  = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storagecontainer" {
  name   = "terraformshcontainer"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

output "storage-access-key1" {
  value = azurerm_storage_account.storage.primary_access_key 
}                                        # need for the access key for the backend