## Create cluster

```bash
export TF_VAR_YC_CLOUD_ID=""
export TF_VAR_YC_FOLDER_ID=""
export TF_VAR_YC_TOKEN=""
export TF_VAR_YC_ZONE="ru-central1-a"

export TF_VAR_VAULT_TOKEN=""
export TF_VAR_VAULT_ADDR=""

terraform workspace new example
terraform workspace new example

terraform plan    -var-file vars/example.tfvars

terraform apply   -var-file vars/example.tfvars

terraform destroy -var-file vars/example.tfvars
```