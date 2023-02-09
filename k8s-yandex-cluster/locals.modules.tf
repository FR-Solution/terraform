locals {
  global_vars         = module.kubernetes.k8s_global_vars
  kube_apiserver_ip   = module.kubernetes.kube-apiserver-lb
  kube_apiserver_port = module.kubernetes.k8s_global_vars.kubernetes-ports.kube-apiserver-port-lb
}
