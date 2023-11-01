output "apim_name" {
  value       = azurerm_api_management.this.name
  description = "The Name of the API Management Service."
}

output "apim_rg" {
  value       = azurerm_api_management.this.resource_group_name
  description = "The Name of the API Management Service resource group."
}

output "apim_id" {
  value       = azurerm_api_management.this.id
  description = "The ID of the API Management Service."
}

output "apim_gateway_url" {
  value       = azurerm_api_management.this.gateway_url
  description = "The URL of the Gateway for the API Management Service."
}

output "apim_gateway_regional_url" {
  value       = azurerm_api_management.this.gateway_regional_url
  description = "The Region URL for the Gateway of the API Management Service."
}

output "apim_management_api_url" {
  value       = azurerm_api_management.this.management_api_url
  description = "The URL for the Management API associated with this API Management service."
}

output "apim_portal_url" {
  value       = azurerm_api_management.this.portal_url
  description = "The URL for the Publisher Portal associated with this API Management service."
}

output "apim_developer_portal_url" {
  value       = azurerm_api_management.this.developer_portal_url
  description = "The URL for the Developer Portal associated with this API Management service."
}

output "apim_scm_url" {
  value       = azurerm_api_management.this.scm_url
  description = "The URL for the SCM (Source Code Management) Endpoint associated with this API Management service."
}

output "cs_canadaeast_id" {
  description = "The ID of the Azure Cognitive Services account in Canada East."
  value       = azurerm_cognitive_account.cs-canadaeast.id
}

output "cs_canadaeast_name" {
  description = "The name of the Azure Cognitive Services account in Canada East."
  value       = azurerm_cognitive_account.cs-canadaeast.name
}

output "cs_canadaeast_location" {
  description = "The Azure region where the Cognitive Services account in Canada East is located."
  value       = azurerm_cognitive_account.cs-canadaeast.location
}

output "cs_canadaeast_primary_access_key" {
  description = "The primary access key for the Azure Cognitive Services account in Canada East."
  value       = azurerm_cognitive_account.cs-canadaeast.primary_access_key
  sensitive   = true
}

output "cs_canadaeast_secondary_access_key" {
  description = "The secondary access key for the Azure Cognitive Services account in Canada East."
  value       = azurerm_cognitive_account.cs-canadaeast.secondary_access_key
  sensitive   = true
}

output "cs_canadaeast_custom_subdomain_name" {
  description = "The custom subdomain name of the Azure Cognitive Services account in Canada East."
  value       = azurerm_cognitive_account.cs-canadaeast.custom_subdomain_name
}

output "cognitive_deployment_canadaeast_id" {
  description = "The ID of the Azure Cognitive Services deployment in Canada East."
  value       = azurerm_cognitive_deployment.canadaeast.id
}

output "cognitive_deployment_canadaeast_name" {
  description = "The name of the Azure Cognitive Services deployment in Canada East."
  value       = azurerm_cognitive_deployment.canadaeast.name
}

output "cs_swedencentral_id" {
  description = "The ID of the Azure Cognitive Services account in Sweden Central."
  value       = azurerm_cognitive_account.cs-swedencentral.id
}

output "cs_swedencentral_name" {
  description = "The name of the Azure Cognitive Services account in Sweden Central."
  value       = azurerm_cognitive_account.cs-swedencentral.name
}

output "cs_swedencentral_location" {
  description = "The Azure region where the Cognitive Services account in Sweden Central is located."
  value       = azurerm_cognitive_account.cs-swedencentral.location
}

output "cs_swedencentral_primary_access_key" {
  description = "The primary access key for the Azure Cognitive Services account in Sweden Central."
  value       = azurerm_cognitive_account.cs-swedencentral.primary_access_key
  sensitive   = true
}

output "cs_swedencentral_secondary_access_key" {
  description = "The secondary access key for the Azure Cognitive Services account in Sweden Central."
  value       = azurerm_cognitive_account.cs-swedencentral.secondary_access_key
  sensitive   = true
}


output "cs_swedencentral_custom_subdomain_name" {
  description = "The custom subdomain name of the Azure Cognitive Services account in Sweden Central."
  value       = azurerm_cognitive_account.cs-swedencentral.custom_subdomain_name
}

output "cognitive_deployment_swedencentral_id" {
  description = "The ID of the Azure Cognitive Services deployment in Sweden Central."
  value       = azurerm_cognitive_deployment.swedencentral.id
}

output "cognitive_deployment_swedencentral_name" {
  description = "The name of the Azure Cognitive Services deployment in Sweden Central."
  value       = azurerm_cognitive_deployment.swedencentral.name
}

output "cs_switzerlandnorth_id" {
  description = "The ID of the Azure Cognitive Services account in Switzerland North."
  value       = azurerm_cognitive_account.cs-switzerlandnorth.id
}

output "cs_switzerlandnorth_name" {
  description = "The name of the Azure Cognitive Services account in Switzerland North."
  value       = azurerm_cognitive_account.cs-switzerlandnorth.name
}

output "cs_switzerlandnorth_location" {
  description = "The Azure region where the Cognitive Services account in Switzerland North is located."
  value       = azurerm_cognitive_account.cs-switzerlandnorth.location
}

output "cs_switzerlandnorth_primary_access_key" {
  description = "The primary access key for the Azure Cognitive Services account in Switzerland North."
  value       = azurerm_cognitive_account.cs-switzerlandnorth.primary_access_key
  sensitive   = true
}

output "cs_switzerlandnorth_secondary_access_key" {
  description = "The secondary access key for the Azure Cognitive Services account in Switzerland North."
  value       = azurerm_cognitive_account.cs-switzerlandnorth.secondary_access_key
  sensitive   = true
}

output "cs_switzerlandnorth_custom_subdomain_name" {
  description = "The custom subdomain name of the Azure Cognitive Services account in Switzerland North."
  value       = azurerm_cognitive_account.cs-switzerlandnorth.custom_subdomain_name
}

output "cognitive_deployment_switzerlandnorth_id" {
  description = "The ID of the Azure Cognitive Services deployment in Switzerland North."
  value       = azurerm_cognitive_deployment.switzerlandnorth.id
}

output "cognitive_deployment_switzerlandnorth_name" {
  description = "The name of the Azure Cognitive Services deployment in Switzerland North."
  value       = azurerm_cognitive_deployment.switzerlandnorth.name
}

output "api_management_openai_api_id" {
  description = "The ID of the Azure API Management API for Azure OpenAI."
  value       = azurerm_api_management_api.this.id
}

output "api_management_openai_api_name" {
  description = "The name of the Azure API Management API for Azure OpenAI."
  value       = azurerm_api_management_api.this.name
}

output "api_management_openai_api_display_name" {
  description = "The display name of the Azure API Management API for Azure OpenAI."
  value       = azurerm_api_management_api.this.display_name
}

output "api_management_openai_api_revision" {
  description = "The revision number of the Azure API Management API for Azure OpenAI."
  value       = azurerm_api_management_api.this.revision
}

output "api_management_api_api_policy_id" {
  description = "The ID of the Azure API Management API Policy for Azure OpenAI."
  value       = azurerm_api_management_api_policy.this.id
}



