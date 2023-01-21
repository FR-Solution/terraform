module "k8s-yandex-cluster" {
    source = "git::https://github.com/fraima/terraform-modules//modules/k8s-yandex-cluster-infra?ref=main"

    global_vars = {
      cluster_name    = var.cluster_name
      base_domain     = var.base_domain
      vault_server    = var.VAULT_ADDR

      service_cidr    = var.cidr.service
      pod_cidr        = var.cidr.pod
      node_cidr_mask  = var.cidr.node_cidr_mask
      
      ssh_username  = "dkot"
      ssh_rsa_path  = "~/.ssh/id_rsa.pub"
    }

    cloud_metadata = {
      folder_id = data.yandex_resourcemanager_folder.current.id
    }

    master_group = {
        name    = "master" # Разрешенный префикс для сертификатов.
        count   = 1

        vpc_id            = data.yandex_vpc_network.cluster-vpc.id
        subnets           = yandex_vpc_subnet.master-subnets
        default_zone      = "ru-central1-a"

        resources_overwrite = {
            master-1 = {
              zone    = "ru-central1-a"
              # disk = {
              #   boot = {
              #     image_id  = "fd8ingbofbh3j5h7i8ll"
              #     # fd8kdq6d0p8sij7h5qe3 | ubuntu-20-04-lts-v20220822
              #     # fd8ingbofbh3j5h7i8ll | ubuntu-22-04-lts-v20220810
              #     # fd8uji8asiui2oetvqps | custom
              #   }
              # }
            }
            master-2 = {
              zone    = "ru-central1-b"
            }
            master-3 = {
              zone    = "ru-central1-c"
            }
        }

        resources = {
          core            = 6
          memory          = 12
          core_fraction   = 100

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
}
