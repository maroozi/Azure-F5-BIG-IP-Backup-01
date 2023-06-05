# Terraform Block
terraform {
  required_version = ">= 1.4.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
  
  subscription_id = "80ea84e8-afce-4851-928a-9e2219724c69"
  tenant_id = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
  client_id = "970aed98-73a9-41fb-a33d-1b260070b4eb"
  client_secret = "mh78Q~xFN6fXuOLj59NeL7L.8Vwb1.xTRXL-laq2"
  
  # Skip Provider Reg (ACG)
  skip_provider_registration = true

  # Backend
  # resource_group_name  = "terraformstate-rg"
  # storage_account_name = "terraformstate201"
  # container_name       = "tfstatefiles"
  # key                  = "terraform.tfstate"



}

# Random String Resource
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}
