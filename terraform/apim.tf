resource "azurerm_api_management" "this" {
  name                = "${var.environment_no_dash}${var.name_prefix}${var.apim.name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  publisher_name      = var.apim.publisher_name
  publisher_email     = var.apim.publisher_email
  sku_name            = var.apim.sku_name
  tags = var.tags
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
  api_name          = azurerm_api_management_api.this.name
  xml_content       = <<XML
<policies>
    <inbound>
        <base />
        <set-variable name="urlId" value="@(new Random(context.RequestId.GetHashCode()).Next(1, 4))" />
        <choose>
            <when condition="@(context.Variables.GetValueOrDefault<int>("urlId") == 1)">
                <set-header name="api-key" exists-action="override">
                    <value>${azurerm_cognitive_account.cs-swedencentral.primary_access_key}</value>
                </set-header>
                <set-backend-service base-url="${azurerm_cognitive_account.cs-swedencentral.endpoint}/openai"/>
            </when>
            <when condition="@(context.Variables.GetValueOrDefault<int>("urlId") == 2)">
                <set-header name="api-key" exists-action="override">
                    <value>${azurerm_cognitive_account.cs-switzerlandnorth.primary_access_key}</value>
                </set-header>
                <set-backend-service base-url="${azurerm_cognitive_account.cs-switzerlandnorth.endpoint}/openai" />
            </when>
            <when condition="@(context.Variables.GetValueOrDefault<int>("urlId") == 3)">
                <set-header name="api-key" exists-action="override">
                    <value>${azurerm_cognitive_account.cs-canadaeast.primary_access_key}</value>
                </set-header>
                <set-backend-service base-url="${azurerm_cognitive_account.cs-canadaeast.endpoint}/openai" />
            </when>
            <otherwise>
                <return-response>
                    <set-status code="500" reason="InternalServerError" />
                    <set-header name="Microsoft-Azure-Api-Management-Correlation-Id" exists-action="override">
                        <value>@{return Guid.NewGuid().ToString();}</value>
                    </set-header>
                    <set-body>A gateway-related error occurred while processing the request.</set-body>
                </return-response>
            </otherwise>
        </choose>
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
XML
}

