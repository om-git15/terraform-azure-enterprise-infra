
variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "prefix" {
  description = "Resource name prefix"
  type        = string
  default     = "om-test"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "vnet_cidr" {
  description = "VNet CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "Map of subnets and CIDRs"
  type        = map(string)
  default = {
    "subnet-app" = "10.0.1.0/24"
    "subnet-db"  = "10.0.2.0/24"
    "AzureFirewallSubnet" = "10.0.3.0/24"
  }
}

variable "nsg_rules" {
  description = "Optional simple NSG rules example"
  type = map(any)
  default = {
    "ssh" = {
      name        = "AllowSSH"
      priority    = 1001
      direction   = "Inbound"
      access      = "Allow"
      protocol    = "Tcp"
      src         = "*"
      dest_ports  = ["22"]
    }
  }
}

variable "storage_account_sku" {
  type    = string
  default = "Standard_LRS"
}


variable "app_service_sku" {
  type    = string
  default = "B1"
}


variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

