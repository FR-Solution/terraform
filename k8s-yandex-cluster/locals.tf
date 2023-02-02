locals {
  global_vars = module.k8s-yandex-cluster.k8s_global_vars
  kube_apiserver_ip = module.k8s-yandex-cluster.kube-apiserver-lb
}

locals {
  master_group = {
    name              = "master"
    count             = 0
    route_table_name  = null
    vpc_name          = null
    default_subnet    = "10.0.0.0/24"
    default_zone      = "ru-central1-a"

    resources_overwrite = {}

    resources = {
      core = 6
      memory = 12
      core_fraction = 100
      disk = {
        boot = {
                image_id  = "fd8kdq6d0p8sij7h5qe3"
                size      = 30
                type      = "network-hdd"
              }
        secondary_disk = {
            etcd = {
            size        = 10
            mode        = "READ_WRITE"
            auto_delete = false
            type        = "network-ssd"
            }
        }
      }
      network_interface = {
          nat = true
      }
    }
    metadata = {
        user_data_template = "fraima" # all | packer | fraima
      }

  }

  master_group_merge = merge(local.master_group, var.master_group)
}
