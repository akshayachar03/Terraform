
```md
# 🚀 Azure Virtual Machine Creation using Terraform

This project demonstrates how to provision a **Linux Virtual Machine** on Microsoft Azure using **Terraform**.  
It includes a virtual network, subnet, NIC, public IP, and the VM itself. It also uses **Azure Storage Account** as a remote backend to store the Terraform state.



## 📁 Directory Structure
---
```
az-vm-creation/
├── main.tf             # Terraform resources to create VM and networking
├── backend.tf          # Remote backend configuration
└── README.md           # This file
````
---
---

## ✅ Prerequisites

- Azure subscription
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) installed
- Azure CLI (`az`) installed and logged in
- SSH key pair generated  
  *(e.g., using `ssh-keygen` if not already available)*

---

## 🌐 Remote Backend Setup (Azure Storage)

This project uses **Azure Storage Account** for storing Terraform state remotely.

### 1. Create a Storage Account and Container
```bash
RESOURCE_GROUP="your-rg"
STORAGE_ACCOUNT="tfstateaksdemo$RANDOM"
CONTAINER_NAME="tfstate"

az group create --name $RESOURCE_GROUP --location eastus
az storage account create --name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP --location eastus --sku Standard_LRS
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT
````

### 2. Update `backend.tf`

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "your-rg"
    storage_account_name = "<your_storage_account>"
    container_name       = "backend"
    key                  = "terraform.tfstate"
  }
}
```

Then run:

```bash
terraform init
```

---

## 🛠️ Usage

### 1. Clone the Repository

```bash
git clone https://github.com/akshayachar03/Terraform.git
cd Terraform/az-vm-creation
```

### 2. Login to Azure

```bash
az login
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review the plan

```bash
terraform plan
```

### 5. Apply the Configuration

```bash
terraform apply
```

---

## 🔐 SSH into the VM

Once created, use the outputted public IP to SSH into the virtual machine:

```bash
ssh adminuser@<public_ip>
```

> Ensure you have your SSH private key (`~/.ssh/id_rsa`) available.

---

## 🧹 Cleanup

To destroy all the resources created:

```bash
terraform destroy
```

---

## 📦 Resources Created

* Azure Resource Group
* Virtual Network & Subnet
* Public IP (Standard SKU)
* Network Interface
* Linux Virtual Machine (Ubuntu 22.04 LTS)

---
