module "keycloak-vault-configuration" {
    source = "git::https://github.com/fraima/terraform-modules//modules/cilium-vault?ref=main"
    
    root_ca_path = "pki-root"
}
