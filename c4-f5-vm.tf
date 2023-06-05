# Virtual Machine
resource "azurerm_virtual_machine" "example" {
  name                  = "f5-bigip-vm"
  location              = azurerm_resource_group.rg1.location
  resource_group_name   = azurerm_resource_group.rg1.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_DS3_v2"

  storage_image_reference {
    publisher = "f5-networks"
    offer     = "f5-big-ip-byol"
    sku       = "f5-big-ltm-1slot-byol"
    version   = "latest"
  }
  plan {
    name      = "f5-big-ltm-1slot-byol"
    publisher = "f5-networks"
    product   = "f5-big-ip-byol"
  }
  os_profile {
    computer_name  = "f5-bigip-vm"
    admin_username = "azureuser"
    admin_password = "y60K8#LGQxsR"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  #depends_on = [azurerm_public_ip.example]
  # Other virtual machine configuration

#   provisioner "local-exec" {
#     command = <<EOT
#       az backup protection enable-for-vm \
#         --resource-group ${azurerm_resource_group.rg1.name} \
#         --vault-name ${azurerm_backup_vault.example.name} \
#         --vm ${azurerm_virtual_machine.example.id} \
#         --policy-name "YourBackupPolicyName"
#     EOT
#     interpreter = ["bash", "-c"]
# }
}