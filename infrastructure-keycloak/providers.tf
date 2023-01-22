terraform {

  backend "local" {
    workspace_dir = "states"
  }

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.6.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.12.0"
    }

  }
  required_version = ">= 1.3.4"
}

provider "vault" {
    address = var.VAULT_ADDR
    token   = var.VAULT_TOKEN
}

provider "keycloak" {
  realm                    = var.KEYCLOAK_REALM
  client_id                = var.KEYCLOAK_CLIENT_ID
  username                 = var.KEYCLOAK_USER
  password                 = var.KEYCLOAK_PASSWORD
  url                      = var.KEYCLOAK_URL
  root_ca_certificate      = ""
  tls_insecure_skip_verify = true
}
