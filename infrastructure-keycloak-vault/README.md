#### Apply basic keycloak configuration

```bash
export TF_VAR_VAULT_TOKEN=""
export TF_VAR_VAULT_ADDR=""


terraform workspace new dev
terraform plan
terraform apply
```