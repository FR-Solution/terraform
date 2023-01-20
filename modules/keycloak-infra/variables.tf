

variable "external_keycloak_url" {
  type = string
  default = "auth.dobry-kot.ru"
}

variable "root_ca_path" {
  type = string
  default = "pki-root"
}

variable "keycloak" {
  description = "Map of Keycloak with their parameters"
  type = map(object({
    realm                     = optional(string, "master")
    client_id                 = optional(string, "admin-cli")
    username                  = string
    password                  = string
    url                       = string
    root_ca_certificate       = optional(string, "")
    tls_insecure_skip_verify  = optional(bool, true)

  }))
  default = {
    "key" = {
      username                  = "admin"
      password                  = "dobrykot"
      url                       = "https://193.32.219.99"
    }
  }
}

variable "vault" {
  description = "Map of vault with their parameters"
  type = map(object({
    address = string
    token   = string

  }))
  default = {
    "key" = {
      address = "http://193.32.219.99:9200/"
      token   = "hvs.IzofveQ3sJEhSI0iad15omUe"

    }
  }
}
