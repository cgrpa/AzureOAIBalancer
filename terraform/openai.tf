resource "azurerm_cognitive_account" "cs-canadaeast" {
  name                = "${var.environment}${var.name_prefix}cs-oai-canadaeast"
  location            = "CanadaEast"
  resource_group_name = azurerm_resource_group.this.name
  kind                = "OpenAI"
  sku_name            = "S0"
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
  custom_subdomain_name = "${var.environment}canadaeast-${var.name_prefix_no_dash}"
}

resource "azurerm_cognitive_deployment" "canadaeast" {
  name                 = "${var.openai_model.name}"
  cognitive_account_id = azurerm_cognitive_account.cs-canadaeast.id
  model {
    format  = "OpenAI"
    name    = var.openai_model.name
    version = var.openai_model.modelid
  }
  scale {
    type     = "Standard"
    capacity = var.openai_tpm
  }
}

// Sweden Central

resource "azurerm_cognitive_account" "cs-swedencentral" {
  name                = "${var.environment}${var.name_prefix}cs-oai-swedencentral"
  location            = "SwedenCentral"
  resource_group_name = azurerm_resource_group.this.name
  kind                = "OpenAI"
  sku_name            = "S0"
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
  custom_subdomain_name = "${var.environment}swedencentral-${var.name_prefix_no_dash}"
}

resource "azurerm_cognitive_deployment" "swedencentral" {
  name                 = "${var.openai_model.name}"
  cognitive_account_id = azurerm_cognitive_account.cs-swedencentral.id
  model {
    format  = "OpenAI"
    name    = var.openai_model.name
    version = var.openai_model.modelid
  }
  scale {
    type     = "Standard"
    capacity = var.openai_tpm
  }
}

// Switzerland North
resource "azurerm_cognitive_account" "cs-switzerlandnorth" {
  name                = "${var.environment}${var.name_prefix}cs-oai-switzerlandnorth"
  location            = "SwitzerlandNorth"
  resource_group_name = azurerm_resource_group.this.name
  kind                = "OpenAI"
  sku_name            = "S0"
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
  custom_subdomain_name = "${var.environment}switzerlandnorth-${var.name_prefix_no_dash}"
}

resource "azurerm_cognitive_deployment" "switzerlandnorth" {
  name                 = "${var.openai_model.name}"
  cognitive_account_id = azurerm_cognitive_account.cs-switzerlandnorth.id
  model {
    format  = "OpenAI"
    name    = var.openai_model.name
    version = var.openai_model.modelid
  }
  scale {
    type     = "Standard"
    capacity = var.openai_tpm
  }
}

