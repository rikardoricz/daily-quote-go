# Terraform with Azure

> Currently running via terraform cli.

Made basic setup on Azure to allow terraform to authenticate:
1. Created App Registration in Entra ID
2. Assigned permissions (Contributor) to App Registration created in `1.`
3. Added a client secret for App Registration created in `1.`
4. Copied values for Client Secret, Client ID, Subscription ID and Directory (tenant) ID
5. Added values from `4.` to `.zshrc`
6. Tested with terraform cli

Current workflow:
1. In `deployments/terraform/backend` run:
```sh
terraform init
terraform plan
terraform apply
```
This creates resource group, storage account and storage container for tfstate in Azure, and outputs variables to put in `deployments/terraform/environments/{prod|dev}/terraform.tf` and use as remote backend.

2. Copy outputed values (resource_group_name,sorage_account_name, container_name) to backend block in `deployments/terraform/environments/{prod|dev}/terraform.tf`

3. In `deployments/terraform/environments/{prod|dev}` run:

```sh
terraform init
terraform plan
terraform apply
```
this provisions infra and uses Azure remote backend storage for tfstate

> Both prod and dev environments have their own tfstate file: `{dev|prod}.terraform.tfstate`
