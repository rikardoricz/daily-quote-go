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
```sh
# in deployments/terraform/tf-backend run:
terraform init
terraform plan
terraform apply
# this creates storage in Azure for storing tfstate file

# in deployments/terraform run:
terraform init
terraform plan
terraform apply
# this provisions infra declared in deployments/terraform directory, uses Azure remote backend storage for tfstate
```