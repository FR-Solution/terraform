#### Apply basic yandex configuration

```bash
export TF_VAR_YC_CLOUD_ID=
export TF_VAR_YC_FOLDER_ID=
export TF_VAR_YC_TOKEN=
export TF_VAR_YC_ZONE=ru-central1-a

terraform workspace new dev
terraform plan
terraform apply
```