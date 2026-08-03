
resource "azurerm_storage_account" "storageacc" {
  for_each = var.storage_account
  name     = each.value.name
  resource_group_name = each.value.rg
  location = each.value.location
  account_tier = each.value.account_tier
  account_replication_type = each.value.rep
  public_network_access_enabled = true
}