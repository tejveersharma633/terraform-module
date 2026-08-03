terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.73.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rules

    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.src_port
      destination_port_range     = security_rule.value.dst_port
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}