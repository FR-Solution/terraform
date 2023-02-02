module "k8s-yandex-cloud-controller" {
  source = "git::https://github.com/fraima/terraform-modules//modules/k8s-yandex-cloud-controller?ref=main"

  yandex_default_vpc_name         = var.master_group.vpc_name
  yandex_default_route_table_name = var.master_group.route_table_name

  k8s_api_server      = local.kube_apiserver_ip
  k8s_api_server_port = local.global_vars.kubernetes-ports.kube-apiserver-port-lb

  pod_cidr      = local.global_vars.k8s_network.pod_cidr

  cluster_name  = local.global_vars.cluster_metadata.cluster_name

  chart_version = "0.0.3"

}
