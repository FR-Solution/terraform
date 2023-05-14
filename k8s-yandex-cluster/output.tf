output "LB-IP" {
    value = "kubectl config set-cluster  cluster --server=https://${try(module.kubernetes.kube-apiserver-lb, "")}:${module.kubernetes.k8s_global_vars.kubernetes-ports.kube-apiserver-port-lb} --insecure-skip-tls-verify"
}