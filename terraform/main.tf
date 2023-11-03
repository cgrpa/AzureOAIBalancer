terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }

  }
  backend "azurerm" {
    resource_group_name = ""
  }
}

provider "azurerm" {
  features {
    cognitive_account {
      purge_soft_delete_on_destroy = true
    }
    api_management {
      purge_soft_delete_on_destroy = true
    }
  }
  skip_provider_registration = true
  subscription_id = var.subscriptionId
}

resource "azurerm_resource_group" "this" {
  name     = "${var.environment}${var.name_prefix}rg-01"
  location = var.location
  tags     = var.tags
}