# module "yandex-csi-controller" {
#     source = "git::https://github.com/fraima/terraform-modules//modules/helm-yandex-csi-controller?ref=main"

#     depends_on = [
#         module.cilium
#     ]

#     namespace           = "kube-fraime-controllers"

#     chart_version       = "0.0.6"
#     global_vars         = local.global_vars
#     extra_values = {
#         provider = {
#             secret = {
#                 enabled = false
#                 name = "yandex-k8s-controllers"
#             }
#         }
#     } 
# }
