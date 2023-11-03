locals {
  cognitive_accounts_keys = tolist(keys(var.cognitive_accounts))
  cognitive_accounts_list = [
    for idx, account_key in local.cognitive_accounts_keys : {
      index             = idx + 1  
      primary_access_key = azurerm_cognitive_account.cs[account_key].primary_access_key
      endpoint          = trim(azurerm_cognitive_account.cs[account_key].endpoint, "/")  # ensure no trailing slash
    }
  ]
}



resource "azurerm_api_management" "this" {
  name                = "${var.environment}${var.name_prefix}${var.apim.name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  publisher_name      = var.apim.publisher_name
  publisher_email     = var.apim.publisher_email
  sku_name            = var.apim.sku_name


  tags = var.tags


    depends_on = [
    azurerm_cognitive_account.cs
  ]
  
}


resource "azurerm_api_management_api" "this" {
  name                = "${var.environment_no_dash}${var.name_prefix}openai-api"
  resource_group_name = azurerm_resource_group.this.name
  api_management_name = azurerm_api_management.this.name
  revision            = "1"
  display_name        = "Azure OpenAI API"
  path                = "openai"
  protocols           = ["https"]

  import {
    content_format = "openapi+json"
    content_value  = file("${path.module}/swagger/inference.json")
  }
}





resource "azurerm_api_management_api_policy" "this" {
  resource_group_name = azurerm_resource_group.this.name
  api_management_name = azurerm_api_management.this.name
  api_name            = azurerm_api_management_api.this.name
    xml_content = templatefile("${path.module}/templates/apim_policy_template.tmpl", {
    accounts        = local.cognitive_accounts_list,
    total_accounts  = length(local.cognitive_accounts_list)
  })
      depends_on = [
    azurerm_cognitive_account.cs
  ]
}



resource "azurerm_api_management_product" "this" {
  product_id          = "azureoai"
  api_management_name = azurerm_api_management.this.name
  resource_group_name = azurerm_resource_group.this.name
  display_name        = "Azure OpenAI"
  description         = "A bundle of Azure OpenAI APIs"
  approval_required   = false
  subscriptions_limit = 1

  subscription_required = true
  published             = true
}

resource "azurerm_api_management_product_api" "this" {
  api_name            = azurerm_api_management_api.this.name
  product_id          = azurerm_api_management_product.this.product_id
  api_management_name = azurerm_api_management.this.name
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_api_management_subscription" "this" {
  subscription_id     = "${var.environment_no_dash}-${var.name_prefix}-openai-subscription"
  resource_group_name = azurerm_resource_group.this.name
  api_management_name = azurerm_api_management.this.name
  product_id          = azurerm_api_management_product.this.id
  display_name        = "${var.environment_no_dash} ${var.name_prefix} OpenAI Subscription"
  state               = "active"
  allow_tracing       = true
}