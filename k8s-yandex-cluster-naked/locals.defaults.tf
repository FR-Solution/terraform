locals {
  global_vars         = module.kubernetes.k8s_global_vars
  kube_apiserver_ip   = try(module.kubernetes.kube-apiserver-lb, "")
  kube_apiserver_port = module.kubernetes.k8s_global_vars.kubernetes-ports.kube-apiserver-port-lb
}

locals {
  master_group = {
    name              = "master"
    count             = 0
    vpc_name          = "vpc.clusters"
    route_table_name  = "vpc-clusters-route-table"
    default_subnet    = "10.0.0.0/24"
    default_zone      = "ru-central1-a"

    resources_overwrite = {
      # master-1 = {
      #   network_interface = {
      #     zone    = "ru-central1-a"
      #     subnet  = "10.1.0.0/24"
      #   }

      # }
      # master-2 = {
      #   network_interface = {
      #     zone    = "ru-central1-b"
      #     subnet  = "10.2.0.0/24"
      #   }
      # }
      # master-3 = {
      #   network_interface = {
      #     zone    = "ru-central1-c"
      #     subnet  = "10.3.0.0/24"
      #   }
      # }
    }

    resources = {
      core          = 6
      memory        = 12
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
        user_data_template = "fraima" # all | fraima | fraima-hbf 
      }

  }

  master_group_merge = merge(local.master_group, var.master_group)
}

