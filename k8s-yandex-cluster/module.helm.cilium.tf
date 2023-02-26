module "cilium" {
  source = "git::https://github.com/fraima/terraform-modules//modules/helm-yandex-cilium?ref=main"
  depends_on = [
    module.yandex-cloud-controller,
  ]
  chart_version = "1.12.6"

  global_vars         = local.global_vars
  cluster_id          = var.global_vars.cilium.cluster_id
  extra_values        = {} 
}
