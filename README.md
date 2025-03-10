# Practice Examples - Terraform Learn

This folder contains various Terraform practice exercises to help understand and implement Terraform concepts.

## Folder Structure

```
│── Example-1/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── outputs.tf
│── README.md

│── Example-2/
├── backend.tf
├── main.tf
├── outputs.tf
├── terraform.tfvars
├── variables.tf
└── README.md

│── Example-3/
├── main.tf
├── terraform.tfvars
├── modules/
│   ├── ec2_instance/
│   │   ├── main.tf
└── README.md

Example-4/
│── main.tf
└── README.md
```

## Prerequisites
- Terraform installed on your system
- AWS credentials configured (if applicable)

## Usage
1. Navigate to the specific example folder:
   ```sh
   cd Example-1
   ```
2. Initialize Terraform:
   ```sh
   terraform init
   ```
3. Preview the execution plan:
   ```sh
   terraform plan
   ```
4. Apply the changes:
   ```sh
   terraform apply -auto-approve
   ```
5. Destroy the resources (if needed):
   ```sh
   terraform destroy -auto-approve
   ```

## Notes
- Modify the `variables.tf` file as needed.
- Use `terraform fmt` to format the files.
