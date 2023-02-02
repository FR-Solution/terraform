module "k8s-yandex-cloud-controller" {
  source = "git::https://github.com/fraima/terraform-modules//modules/k8s-yandex-cloud-controller?ref=main"

  chart_version = "0.0.3"

  yandex_default_vpc_name         = var.master_group.vpc_name
  yandex_default_route_table_name = var.master_group.route_table_name

  global_vars         = module.k8s-yandex-cluster.k8s_global_vars
  
  extra_values        = {} 

}
