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

output "subscription_primary_key" {
  value = azurerm_api_management_subscription.this.primary_key
  description = "The primary subscription key for accessing the Azure OpenAI APIs."
  sensitive = true
}