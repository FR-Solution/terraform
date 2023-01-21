output "LB-IP" {
    value = "kubectl config set-cluster  ${var.cluster_name} --server=https://${module.k8s-yandex-cluster.kube-apiserver-lb} --insecure-skip-tls-verify"
}