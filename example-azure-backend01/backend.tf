provider "azurerm" {
  version = "=2.5.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

terraform {
    backend "azurerm" {
       resource_group_name = "backend-rg"
       storage_account_name = "terraformshstorageacc"
       container_name = "terraformshcontainer"
       key = "terraform.tfstate"
       access_key = "1kNv0GGSoLVASrPQhnJkz6V0eSOdtyUX1wT3p5yKnUm+lYWMYj1qGjwzsFGagcF3LMWMlxntJJBezfMx//DMoQ=="
    }
}
