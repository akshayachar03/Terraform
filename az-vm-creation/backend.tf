terraform {
  backend "azurerm" {
    resource_group_name  = "example-resources1"
    storage_account_name = "akshaystorageaccount03"
    container_name       = "backend"
    key                  = "terraform.tfstate" 
  }
}
