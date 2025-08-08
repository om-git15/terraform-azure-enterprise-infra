# Create one NSG per intention (simple approach)
resource "azurerm_network_security_group" "nsg_app" {
  name                = "${var.prefix}-${var.environment}-nsg-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags
}

# Add example SSH rule (you can add more)
resource "azurerm_network_security_rule" "ssh" {
  name                        = var.nsg_rules["ssh"].name
  priority                    = var.nsg_rules["ssh"].priority
  direction                   = var.nsg_rules["ssh"].direction
  access                      = var.nsg_rules["ssh"].access
  protocol                    = var.nsg_rules["ssh"].protocol
  source_port_range           = "*"
  destination_port_ranges     = var.nsg_rules["ssh"].dest_ports
  source_address_prefix       = var.nsg_rules["ssh"].src
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_app.name
}

# Associate NSG to subnet-app (if exists)
resource "azurerm_subnet_network_security_group_association" "app_assoc" {
  count                     = contains(keys(var.subnets), "subnet-app") ? 1 : 0
  subnet_id                 = azurerm_subnet.subnet["subnet-app"].id
  network_security_group_id = azurerm_network_security_group.nsg_app.id
}
