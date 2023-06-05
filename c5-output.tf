# Outputs
output "mgmtPublicIP" {
  value = azurerm_public_ip.example.ip_address
}

output "mgmtPublicDNS" {
  value = azurerm_public_ip.example.fqdn
}

output "mgmtPort" {
  value = "8443"
}

# output "f5_username" {
#   value = "your_admin_username"
# }

# output "bigip_password" {
#   value = "your_admin_password"
# }

# output "mgmtPublicURL" {
#   value = "https://${azurerm_public_ip.example.fqdn}:8443"
# }

output "resourcegroup_name" {
  value = azurerm_resource_group.rg1.name
}

output "public_addresses" {
  value = [azurerm_public_ip.example.ip_address]
}

output "private_addresses" {
  value = [azurerm_network_interface.example.private_ip_address]
}