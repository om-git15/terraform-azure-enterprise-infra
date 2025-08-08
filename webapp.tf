resource "azurerm_service_plan" "asp" {
  name                = local.resource_names.appplan
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = var.app_service_sku
  tags                = local.tags
}

resource "azurerm_linux_web_app" "webapp" {
  name                = local.resource_names.webapp
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      node_version = "14-lts"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}
