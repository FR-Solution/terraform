#### Apply basic vault configuration

```bash
export TF_VAR_YC_CLOUD_ID=""
export TF_VAR_YC_FOLDER_ID=""
export TF_VAR_YC_TOKEN=""
export TF_VAR_YC_ZONE="ru-central1-a"

export TF_VAR_VAULT_TOKEN=""
export TF_VAR_VAULT_ADDR=""

terraform workspace new dev
terraform plan  -var-file vars/cluster-example.tfvars
terraform apply -var-file vars/cluster-example.tfvars
```