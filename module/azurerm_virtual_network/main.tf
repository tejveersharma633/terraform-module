
resource "azurerm_virtual_network" "virtualnetwork" {
  for_each = var.virtual_network
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.aspace
}
