module "vault-root-pki-configuration" {
    source = "git::https://github.com/fraima/terraform-modules//modules/vault-root-pki?ref=main"
    
    root-pki = {
      extra-args = {
        path        = "pki-root"
        description = "This is pki root"
      }
    }
}
