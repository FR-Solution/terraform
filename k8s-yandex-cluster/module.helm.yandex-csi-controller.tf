module "yandex-csi-controller" {
    source = "git::https://github.com/fraima/terraform-modules//modules/helm-yandex-csi-controller?ref=main"

    # depends_on = [
    #     module.cilium
    # ]

    chart_version       = "0.0.4"
    global_vars         = local.global_vars
    extra_values        = {} 
}
