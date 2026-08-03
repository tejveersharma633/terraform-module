rg_name = {
  rg1 = {
    name     = "rg-dev"
    location = "centralindia"
  }
}


storage_account = {
  sa1 = {
    name         = "storageaccount2025280"
    location     = "centralindia"
    rg           = "rg-dev"
    account_tier = "Standard"
    rep          = "LRS"
  }
  sa2 = {
    name         = "storageaccount2025290"
    location     = "centralindia"
    rg           = "rg-dev"
    account_tier = "Standard"
    rep          = "LRS"
  }
}

virtual_network = {
  virtualN1 = {
    name                = "virtualnetworkdemo1"
    location            = "centralindia"
    resource_group_name = "rg-dev"
    aspace              = ["10.0.0.0/16"]
  }
  virtualN2 = {
    name                = "virtualnetworkdemo2"
    location            = "centralindia"
    resource_group_name = "rg-dev"
    aspace              = ["10.1.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name       = "subnetdemo1"
    rg         = "rg-dev"
    virtualnet = "virtualnetworkdemo1"
    aspace     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name       = "subnetdemo1-1"
    rg         = "rg-dev"
    virtualnet = "virtualnetworkdemo1"
    aspace     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name       = "subnetdemo2"
    rg         = "rg-dev"
    virtualnet = "virtualnetworkdemo2"
    aspace     = ["10.1.123.0/24"]
  }
  subnet4 = {
    name       = "subnetdemo2-2"
    rg         = "rg-dev"
    virtualnet = "virtualnetworkdemo2"
    aspace     = ["10.1.143.0/24"]
  }
  bastionsubnet1 = {
    name                 = "AzureBastionSubnet"
    rg  = "rg-dev"
    virtualnet = "virtualnetworkdemo1"
    aspace     = ["10.0.143.0/26"]
  }
}


publicip = {
  publicbastion = {
    name                = "bastiopip"
    location            = "centralindia"
    resource_group_name = "rg-dev"
  }
  vm1 = {
    name                = "vmpip1"
    location            = "centralindia"
    resource_group_name = "rg-dev"
  }
  vm2 = {

    name                = "vmpip2"
    location            = "centralindia"
    resource_group_name = "rg-dev"
  }
}

# nsg_name             = "acceptanceTestSecurityGroup1"
# location             = "centralindia"
# resource_group_name  = "rg-dev"

# security_rules = {
#   ssh = {
#     priority  = 100
#     direction = "Inbound"
#     access    = "Allow"
#     protocol  = "Tcp"
#     src_port  = "*"
#     dst_port  = "22"
#   }

#   http = {
#     priority  = 110
#     direction = "Inbound"
#     access    = "Allow"
#     protocol  = "Tcp"
#     src_port  = "*"
#     dst_port  = "80"
#   }
# }

nics = {
  nic1 = {
    name                = "vnic1"
    location            = "centralindia"
    vnet_name           = "virtualnetworkdemo1"
    resource_group_name = "rg-dev"
    pipip               = "vmpip1"
    datasubnetname      = "subnetdemo1"
  }

  # nic2 = {
  #   name                 = "vnic2"
  #   location             = "centralindia"
  #   resource_group_name  = "rg-dev"
  #   datasubnetname      = "data-subnet"
  #   pipip= "vmpip2"
  #   subnet_id            = "subnetdemo2"
  #  }

  nic3 = {
    name                = "vnic3"
    location            = "centralindia"
    vnet_name           = "virtualnetworkdemo2"
    resource_group_name = "rg-dev"
    datasubnetname      = "subnetdemo2"
    pipip               = "vmpip2"
  }
}

vmdemo = {
  vm1 = {
    name                = "Virtual-machine1"
    resource_group_name = "rg-dev"
    datavm              = "vnic1"
    keyvaltname         = "kv-dev-tej2"
    location            = "centralindia"
        username_secret_name = "vm-admin-username"
    password_secret_name = "vm-admin-password"
    # admin_username = "azureuser"
    # admin_password = "P@$$w0rd1234!"
    publisher      = "Canonical"
    offer          = "0001-com-ubuntu-server-jammy"
    sku            = "22_04-lts-gen2"
    version        = "latest"
  }
  # vm2 = {
  #   name                  = "Virtual-machine2"
  #   resource_group_name   = "rg-dev"
  #   location              = "centralindia"
  #   network_interface_ids = ["/subscriptions/5370b509-fed5-401b-a28f-6a8aa7263ccd/resourceGroups/rg-dev/providers/Microsoft.Network/networkInterfaces/vnic2"]
  #   # admin_username        = "azureuser"
  #   # admin_password        = "P@$$w0rd1234!"
  #   publisher             = "Canonical"
  #   offer                 = "0001-com-ubuntu-server-jammy"
  #   sku                   = "22_04-lts-gen2"
  #   version               = "latest"
  # }
  vm3 = {
    name                = "Virtual-machine3"
    resource_group_name = "rg-dev"
    keyvaltname         = "kv-dev-tej2"
    datavm              = "vnic3"
    location            = "centralindia"
    username_secret_name = "vm-admin-username"
    password_secret_name = "vm-admin-password"
    # admin_username = "azureuser"
    # admin_password = "P@$$w0rd1234!"
    publisher      = "Canonical"
    offer          = "0001-com-ubuntu-server-jammy"
    sku            = "22_04-lts-gen2"
    version        = "latest"
  }
}

bastion = {
  bastionpublic = {
    name                 = "pubbastion"
    location             = "centralindia"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnetdemo1"
    public_ip_address_id = "/subscriptions/5370b509-fed5-401b-a28f-6a8aa7263ccd/resourceGroups/rg-dev/providers/Microsoft.Network/publicIPAddresses/bastiopip"
  }
}

vnetpeer = {
  peer1 = {
    name                      = "peer1to2"
    resource_group_name       = "rg-dev"
    virtual_network_name      = "virtualnetworkdemo1"
    remote_virtual_network_id = "/subscriptions/5370b509-fed5-401b-a28f-6a8aa7263ccd/resourceGroups/rg-dev/providers/Microsoft.Network/virtualNetworks/virtualnetworkdemo2"
  }
  peer2to1 = {
    name                      = "peer2to1"
    resource_group_name       = "rg-dev"
    virtual_network_name      = "virtualnetworkdemo2"
    remote_virtual_network_id = "/subscriptions/5370b509-fed5-401b-a28f-6a8aa7263ccd/resourceGroups/rg-dev/providers/Microsoft.Network/virtualNetworks/virtualnetworkdemo1"
  }
}

keyvault = {
  vault1 = {
    name                = "kv-dev-tej2"
    resource_group_name = "rg-dev"
    location            = "centralindia"
  }
}