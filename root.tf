
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
    random = {
      source = "hashicorp/random"
      version = "3.0.1"
    }
  }
}
provider "azurerm" {
  features {
    
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "webapprnd" {
  length  = 8
  lower   = true
  number  = true
  upper   = false
  special = false
}

resource "random_id" "server1" {
 
  byte_length = 8
}
