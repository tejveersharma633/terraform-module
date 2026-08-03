module "resource_group" {
  source  = "../module/azurerm_resource_group"
  rg_name = var.rg_name
}

module "storage_account" {
  depends_on      = [module.resource_group]
  source          = "../module/azurerm_storage_account"
  storage_account = var.storage_account
}

module "virtual_network" {
  depends_on      = [module.resource_group]
  source          = "../module/azurerm_virtual_network"
  virtual_network = var.virtual_network
}

module "subnet" {
  depends_on = [module.virtual_network, module.resource_group]
  source     = "../module/azurerm_subnet"
  subnet     = var.subnet
}

module "publicip" {
  depends_on = [module.resource_group, module.subnet]
  source     = "../module/azurerm_public_ip"
  publicip   = var.publicip
}

module "nics" {
  depends_on = [module.resource_group, module.subnet, module.publicip]
  source     = "../module/azurerm_virtual_network_interface"
  nics       = var.nics
}

module "kvault" {
  depends_on = [module.resource_group]
  source     = "../module/azurerm_key_vault"
  keyvault   = var.keyvault
}


module "vmdemo" {
  depends_on = [module.nics, module.resource_group, module.subnet, module.publicip,module.kvault]
  source     = "../module/azurerm_linux_virtual_machine"
  vmdemo     = var.vmdemo
}



module "bastion" {
depends_on = [module.resource_group]
  source = "../module/azurerm_bastion_host"
  bastion  = var.bastion
}


module "vnetpeer" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../module/azurerm_virtual_network_peering"
  vnetpeer   = var.vnetpeer
}

