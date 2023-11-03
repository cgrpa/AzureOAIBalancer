# AzureOAIBalancer

AzureOAIBalancer is a Terraform repository for automating the deployment of a load-balanced Azure OpenAI environment across multiple regions. It aims to increase throughput and manage high request volumes for any OpenAI model by distributing workloads evenly.

![Load Balancer Diagram](https://github.com/cgrpa/AzureOAIBalancer/assets/95618126/08717c1a-d240-42bd-a5ae-3b0f2e8bf67a)

Utilizing a random integer-based load balancer, it's advisable to implement a backoff strategy on the client side to handle RateLimitError. In the event of encountering a rate limit error, retrying the request should lead to a random redirection to a different deployment, bypassing the rate limit obstacle.

Includes Swagger UI

Screens

![example1](https://github.com/cgrpa/AzureOAIBalancer/assets/95618126/226073c2-9d1b-473c-9abd-54ce3312cd37)

![example2](https://github.com/cgrpa/AzureOAIBalancer/assets/95618126/85f23a67-d72f-4de7-9b75-5c446d828a95)

## Setup Instructions

### Prerequisites

Before you begin, ensure you have the following prerequisites met:

- Terraform installed on your local machine.
- An Azure subscription and the Azure CLI installed and configured.
- Access to the OpenAI models in the desired Azure regions.

### Configuration Steps

1. **Set the Azure Subscription ID**

   Locate the `var.tf` file in your repository, and set your Azure `subscriptionId`. This will be used across all Terraform configurations to deploy resources in your Azure account.

   ```hcl
   variable "subscription_id" {
     description = "The Subscription ID used for the Azure resources."
     type        = string
   }
   ```
2. **Modify Cognitive Account Locations**

   In the `var.tf` file, update the `cognitive_accounts` object with the locations you require. Make sure that you have access to the OpenAI models in these regions.

   ```hcl
   variable "cognitive_accounts" {
     description = "A map of cognitive account locations and their details."
     type        = map(object({
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
   ```

3. **Configure the Backend**

   If you are using a remote backend for Terraform state, such as Azure Blob Storage, configure the backend "azurerm" section in your Terraform configurations. If you're not using a remote backend, this section can be removed.

   ```hcl
   terraform {
     backend "azurerm" {
       resource_group_name  = "YourResourceGroupName"
       storage_account_name = "YourStorageAccountName"
       container_name       = "YourContainerName"
       key                  = "terraform.tfstate"
     }
   }
   ```

4. **Deployment**

   After configuring the necessary files, you can proceed with the Terraform deployment process:

   - Initialize Terraform to download the required providers.

     ```bash
     terraform init
     ```

   - Plan the deployment to review the changes Terraform will make.

     ```bash
     terraform plan
     ```

   - Apply the configuration to create the resources in Azure.

     ```bash
     terraform apply
     ```

For additional details on managing and troubleshooting your deployment, refer to the Terraform documentation.
