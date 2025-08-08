# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.resource_names.rg_name
  location = var.location
  tags     = local.tags
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = local.resource_names.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]
  tags                = local.tags
}

# Subnets (dynamic from var.subnets)
resource "azurerm_subnet" "subnet" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}
