module "cilium" {
  source = "git::https://github.com/fraima/terraform-modules//modules/k8s-yandex-cilium?ref=main"

  chart_version = "1.12.0"

  global_vars         = local.global_vars
  cluster_id          = var.global_vars.cilium.cluster_id
  extra_values        = {} 
}
