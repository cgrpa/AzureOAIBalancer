terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }

    azuread = {
      source = "hashicorp/azuread"
      version = "2.41.0"
    }

  }
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = var.subscriptionId
}

resource "azurerm_resource_group" "this" {
  name     = "${var.environment}${var.name_prefix}rg-01"
  location = var.location
  tags     = var.tags
}