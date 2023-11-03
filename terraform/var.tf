variable "subscriptionId" {
  type        = string
  description = "Subscription ID to deploy to"
  default     = ""
}

variable "application" {
  type        = string
  description = "Application name"
  default     = "Azure OpenAI Load Balancer"
}

variable "location" {
  type        = string
  description = "Azure region to deploy to (rg and apim)"
  default     = "uk south"
}

variable "location_nospace" {
  type        = string
  description = "Azure region to deploy to (rg and apim)"
  default     = "uksouth"
}

variable "environment" {
  type        = string
  description = "Environment (dev- / uat- / prd-)"
  default     = "dev-"
}

variable "environment_no_dash" {
  type        = string
  description = "Environment (dev / uat / prd) no dash for storage accounts etc."
  default     = "dev"
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
    sku_name            = "Consumption_0"  # Consumption SKU.
  }
}


variable "cognitive_accounts" {
  description = "A map of cognitive account locations and their details."
  type = map(object({
    location           : string
    custom_subdomain   : string
  }))
  default = {
    "canadaeast" = {
      location         = "CanadaEast"
      custom_subdomain = "canadaeast"
    },
    "swedencentral" = {
      location         = "SwedenCentral"
      custom_subdomain = "swedencentral"
    },
    "switzerlandnorth" = {
      location         = "SwitzerlandNorth"
      custom_subdomain = "switzerlandnorth"
    }
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
  description = "Tokens per minute (TPM) in thousands. 1 = 1,000" # This is per deployment.
  default     = 10
}

variable "tags" {
  type        = map
  description = "Azure tags"
  default     = {
    Environment = "dev"
    Application = "cgrpa.oailb"
    Product     = "oailb"
    Criticality = "Tier 1"
    Owner       = "John Doe"
    Department  = "INFRASTRUCTURE"
  }
}
