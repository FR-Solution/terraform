terraform {

  backend "local" {
    workspace_dir = "states"
  }

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.81.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.12.0"
    }

  }
  required_version = ">= 0.13"
  # experiments = [module_variable_optional_attrs]
}

provider "yandex" {
  token     = var.YC_TOKEN
  cloud_id  = var.YC_CLOUD_ID
  folder_id = var.YC_FOLDER_ID
  zone      = var.YC_ZONE
}

provider "vault" {
    address = var.VAULT_ADDR
    token   = var.VAULT_TOKEN
}

resource "vault_pki_secret_backend_cert" "terraform-kubeconfig" {
  depends_on = [
    module.kubernetes
  ]
    backend       = local.global_vars.ssl.intermediate.kubernetes-ca.path
    name          = "kube-apiserver-cluster-admin-client"
    common_name   = "custom:terraform-kubeconfig"
}

provider "helm" {
  kubernetes {
    host = "https://${local.kube_apiserver_ip}:${local.kube_apiserver_port}"

    client_certificate     = vault_pki_secret_backend_cert.terraform-kubeconfig.certificate
    client_key             = vault_pki_secret_backend_cert.terraform-kubeconfig.private_key
    cluster_ca_certificate = vault_pki_secret_backend_cert.terraform-kubeconfig.issuing_ca

  }
}
