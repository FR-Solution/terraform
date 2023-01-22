module "keycloak-vault-configuration" {
    source = "git::https://github.com/fraima/terraform-modules//modules/keycloak-vault?ref=main"
    
    root_ca_path = "pki-root"
}
