output "LB-IP" {
    value = "kubectl config set-cluster  cluster --server=https://${local.kube_apiserver_ip}:${local.kube_apiserver_port} --insecure-skip-tls-verify"
}