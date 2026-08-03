data "azurerm_key_vault" "kv" {
  for_each = var.vmdemo

  name                = each.value.keyvaltname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.vmdemo

  name         = each.value.username_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.vmdemo

  name         = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_network_interface" "datanic" {
  for_each = var.vmdemo
  name                = each.value.datavm
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_virtual_machine" "vmachine" {
  for_each              = var.vmdemo
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  vm_size                  = "Standard_d2s_v3"
  network_interface_ids = [data.azurerm_network_interface.datanic[each.key].id]

  storage_os_disk {
    name = "${each.value.name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
    os_profile {
  computer_name = "${each.value.name}-vm"
  admin_username = data.azurerm_key_vault_secret.username[each.key].value
  admin_password = data.azurerm_key_vault_secret.password[each.key].value
    # admin_username = each.value.admin_username
    # admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
 storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}