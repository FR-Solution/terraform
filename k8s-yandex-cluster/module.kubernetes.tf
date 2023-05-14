locals {
  default_var   = file("vars/default.yaml")
  extra_var     = yamlencode(var.global_vars)
}

data "utils_deep_merge_yaml" "deep_merge_global_vars" {
  input = [
    local.default_var, 
    local.extra_var
  ]
}

module "kubernetes" {
    source = "git::https://github.com/fraima/terraform-modules//modules/k8s-yandex-cluster-infra?ref=TFM-49"
    
    global_vars     = yamldecode(data.utils_deep_merge_yaml.deep_merge_global_vars.output)
    cloud_metadata  = var.cloud_metadata
}
