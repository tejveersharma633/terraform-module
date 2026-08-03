terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.74.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_network_interface_security_group_association" "association" {
  for_each = var.nsgassociation
  network_interface_id      = each.value.network_interface_ids
  network_security_group_id = each.value.network_security_group_id
}