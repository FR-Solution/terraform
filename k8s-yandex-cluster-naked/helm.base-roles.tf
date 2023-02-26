resource "helm_release" "base-roles" {
  depends_on = [
    module.kubernetes,
  ]
  name       = "base-roles"
  chart      = "templates/helm/base-roles"
  namespace  = "kube-system"
  values = []
  atomic    = true
}
