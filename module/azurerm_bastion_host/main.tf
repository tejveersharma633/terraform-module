data "azurerm_subnet" "datasubnet" {
for_each = var.nics
name = each.value.datasubnetname
virtual_network_name = each.value.vnet_name
resource_group_name = each.value.resource_group_name
}

resource "azurerm_bastion_host" "jump" {
  for_each            = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.datapip[each.key].id
  }
}
