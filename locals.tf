locals {
  tags = {
    Environment = var.environment
    Owner       = "omchavan1508@gmail.com"
    Project     = "terraform-azure-pro"
  }

  resource_names = {
    rg_name     = "${var.prefix}-${var.environment}-rg"
    vnet_name   = "${var.prefix}-${var.environment}-vnet"
    storage     = "${random_id.sa_hex.hex}"
    webapp      = "${var.prefix}-web-${random_id.web_hex.hex}"
    appplan     = "${var.prefix}-asp"
    vm_name     = "${var.prefix}-vm"
  }
}
