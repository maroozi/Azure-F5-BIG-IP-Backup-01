resource "azurerm_recovery_services_vault" "example" {
  name                = "tfex-recovery-vault"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  sku                 = "Standard"
}

resource "azurerm_backup_policy_vm" "example" {
  name                = "tfex-recovery-vault-policy"
  resource_group_name = azurerm_resource_group.rg1.name
  recovery_vault_name = azurerm_recovery_services_vault.example.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 10
  }
}

data "azurerm_virtual_machine" "example" {
  name                = "f5-bigip-vm"
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = azurerm_resource_group.rg1.name
  recovery_vault_name = azurerm_recovery_services_vault.example.name
  source_vm_id        = data.azurerm_virtual_machine.example.id
  backup_policy_id    = azurerm_backup_policy_vm.example.id
}