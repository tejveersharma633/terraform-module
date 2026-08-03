terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.80.0"
    }
  }
  # backend "azurerm" {
  # resource_group_name = "rg-dev"
  # storage_account_name = "storageaccount2025285"
  # container_name = "mycontainer-blob"
  # key = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

