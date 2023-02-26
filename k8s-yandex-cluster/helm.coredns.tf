resource "helm_release" "coredns" {
  depends_on = [
    module.cilium
  ]
  name       = "coredns"
  repository = "https://coredns.github.io/helm"
  chart      = "coredns"
  version    = "1.19.4"
  namespace  = "kube-fraima-dns"
  create_namespace  = true

  values = [
    templatefile("${path.module}/templates/helm/coredns/values.yaml", {
      clusterIP = module.kubernetes.k8s_global_vars.k8s-addresses.dns_address
    })
    
  ]
  wait      = true
  atomic    = true
}