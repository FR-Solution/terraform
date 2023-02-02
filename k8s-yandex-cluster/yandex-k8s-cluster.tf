module "k8s-yandex-cluster" {
    source = "git::https://github.com/fraima/terraform-modules//modules/k8s-yandex-cluster-infra?ref=main"

    global_vars     = var.global_vars
    cloud_metadata  = var.cloud_metadata
    master_group    = local.master_group_merge
}

resource "vault_pki_secret_backend_cert" "terraform-kubeconfig" {
  depends_on = [
    module.k8s-yandex-cluster
  ]
    backend       = module.k8s-yandex-cluster.k8s_global_vars.ssl.intermediate.kubernetes-ca.path
    name          = "kube-apiserver-cluster-admin-client"
    common_name   = "custom:terraform-kubeconfig"
}
