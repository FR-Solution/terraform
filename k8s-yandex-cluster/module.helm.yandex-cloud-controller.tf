module "yandex-cloud-controller" {
  source = "git::https://github.com/fraima/terraform-modules//modules/helm-yandex-cloud-controller?ref=main"
  depends_on = [
    module.kubernetes,
  ]
  chart_version = "0.0.3"

  yandex_default_vpc_name         = local.master_group_merge.vpc_name
  yandex_default_route_table_name = local.master_group_merge.route_table_name

  global_vars         = local.global_vars
  
  extra_values        = {} 

}
