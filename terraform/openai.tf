resource "azurerm_cognitive_account" "cs" {
  for_each            = var.cognitive_accounts

  name                = "${var.environment}${var.name_prefix}cs-oai-${each.value.custom_subdomain}"
  location            = each.value.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "OpenAI"
  sku_name            = "S0"
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
  custom_subdomain_name = "${var.environment}${each.value.custom_subdomain}-${var.name_prefix_no_dash}"
}

resource "azurerm_cognitive_deployment" "deployment" {
  for_each            = var.cognitive_accounts

  name                 = "${var.openai_model.name}"
  cognitive_account_id = azurerm_cognitive_account.cs[each.key].id
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