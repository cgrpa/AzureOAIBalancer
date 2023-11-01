variable "subscriptionId" {
  type        = string
  description = "Subscription ID to deploy to"
  default     = "__SUBSCRIPTION_ID__"
}

variable "application" {
  type        = string
  description = "Application name"
  default     = "Azure OpenAI Load Balancer"
}

variable "location" {
  type        = string
  description = "Azure region to deploy to"
  default     = "uk south"
}

variable "location_nospace" {
  type        = string
  description = "Azure region to deploy to"
  default     = "uksouth"
}

variable "environment" {
  type        = string
  description = "Environment (dev / uat / prd)"
  default     = "__ENVIRONMENT__"
}

variable "environment_no_dash" {
  type        = string
  description = "Environment (dev / uat / prd)"
  default     = "__ENVIRONMENT_NO_DASH__"
}

variable "name_prefix" {
  type        = string
  description = "Used for the cognitive service name and key vault secret names"
  default     = "loai-"
}

variable "name_prefix_no_dash" {
  type        = string
  description = "Used for service bus and storage account names"
  default     = "loai"
}


variable "apim" {
  type = map
  description = "API Management configuration"
  default = {
    name                = "apim"
    publisher_name      = "John Doe"
    publisher_email     = "john.doe@contoso.com"
    sku_name            = "Consumption_0"  # This is the SKU for the Consumption tier
  }
}

variable "openai_model" {
  type        = map
  description = "Model to deploy"
  default     = {
    name    = "gpt-4"
    modelid = "0613"
  }
}

variable "openai_tpm" {
  type        = number
  description = "Tokens per minute (TPM) in thousands. 1 = 1,000"
  default     = 10
}

variable "tags" {
  type        = map
  description = "Azure tags"
  default     = {
    Environment = "__ENVIRONMENT_NO_DASH__"
    Application = "cgrpa.oailb"
    Product     = "oailb"
    Criticality = "Tier 1"
    Owner       = "John Doe"
    Department  = "INFRASTRUCTURE"
  }
}
