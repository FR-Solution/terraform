#### Apply basic keycloak configuration

```bash
export TF_VAR_KEYCLOAK_REALM="master"
export TF_VAR_KEYCLOAK_CLIENT_ID="admin-cli"
export TF_VAR_KEYCLOAK_USER=""
export TF_VAR_KEYCLOAK_PASSWORD=""
export TF_VAR_KEYCLOAK_URL=""

export TF_VAR_VAULT_TOKEN=""
export TF_VAR_VAULT_ADDR=""


terraform workspace new dev
terraform plan
terraform apply
```