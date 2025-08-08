# terraform-azure-enterprise-infra
Infrastructure as Code (IaC) for Azure using Terraform - resuable,modular, and production-ready.

# terraform-azure-pro

Production-style Terraform demo for Azure infrastructure.

## What it deploys
- Resource Group
- Virtual Network with multiple Subnets (including AzureFirewallSubnet)
- Network Security Group (example) + association
- Storage Account
- App Service Plan + Linux Web App
- Linux Virtual Machine with Public IP and NIC

## Pre-reqs
- Azure CLI: `az login`
- Terraform v1.1+ installed
- Use a sandbox / test subscription (this will create billable resources)

## Quick start
1. `terraform init`
2. `terraform plan -out plan.tfplan`
3. `terraform apply "plan.tfplan"`
4. View outputs: webapp URL, VM public IP

## Notes & best practices
- Change `variables.tf` values to match naming and region
- For team usage, configure remote state with Azure Storage backend
- Comment out heavy resources (VM, public IP) if you want cheaper dry runs
- Destroy resources when done: `terraform destroy -auto-approve`
