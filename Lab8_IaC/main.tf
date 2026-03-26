terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}
  subscription_id = "7b262be5-bab4-4d0d-9595-ad6c6bf3e1ef"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "Canada Central"

  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

resource "azurerm_storage_account" "storage" {
  name = "itsa5501n01761187"   # lowercase letters and numbers
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name = "tf-container"
  storage_account_name = azurerm_storage_account.storage.name
  container_access_type = "private"
}
