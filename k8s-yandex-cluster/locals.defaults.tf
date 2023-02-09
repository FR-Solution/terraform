
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
        user_data_template = "fraima" # all | packer | fraima
      }

  }

  master_group_merge = merge(local.master_group, var.master_group)
}

locals {
  custom_global_vars = {
    cluster_name    = "example"
    base_domain     = "dobry-kot.ru"
    vault_server    = "http://193.32.219.99:9200/"

    service_cidr    = "29.64.0.0/16"
    pod_cidr        = "10.100.0.0/16"
    node_cidr_mask  = "24"
    
    ssh_username  = "dkot"
    ssh_rsa_path  = "~/.ssh/id_rsa.pub"

    cilium = {
        cluster_id = 10
    }
  }

  custom_global_vars_merge = merge(local.custom_global_vars, var.global_vars)

}
