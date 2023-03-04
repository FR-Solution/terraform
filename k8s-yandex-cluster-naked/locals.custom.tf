locals {
  custom_global_vars = {
    cluster_name    = "example"
    base_domain     = "dobry-kot.ru"
    vault_server    = "http://193.32.219.99:9200/"

    service_cidr    = "29.64.0.0/16"
    pod_cidr        = "10.100.0.0/16"
    node_cidr_mask  = "24"
    
    ssh_username  = "dkot"
    ssh_rsa_path  = "~/.ssh/id_rsa.pub"

  }

  custom_global_vars_merge = merge(local.custom_global_vars, var.global_vars)

}
