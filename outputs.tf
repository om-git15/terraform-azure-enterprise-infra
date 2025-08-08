output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "webapp_url" {
  value = "https://${azurerm_linux_web_app.webapp.default_hostname}"
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm_pip.ip_address
}

output "vm_admin_password" {
  value     = random_password.vm_pwd.result
  sensitive = true
}
