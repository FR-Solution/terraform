# resource "yandex_vpc_network" "hbf-vpc" {
#   name = "hbf-vpc"
# }

# resource "yandex_vpc_subnet" "hbf-subnet" {
#     name            = "hbf-subnet"

#     v4_cidr_blocks  = ["10.143.0.0/24"]
#     zone            =  "ru-central1-a"

#     network_id      = yandex_vpc_network.hbf-vpc.id
# }

# resource "yandex_compute_instance" "team-a-backend" {

#   for_each    = {
#     "1": {},
#     "2": {}
#   }

#   description = "HBF-TEAM-A-BACKEND"
#   hostname    = "backend"
#   name        = "backend"
#   platform_id = "standard-v1"

#   zone = "ru-central1-a"

#   resources {
#     cores         = 2
#     memory        = 4
#     core_fraction = 100
#   }

#   boot_disk {
#     initialize_params {
#       image_id = "fd8kdq6d0p8sij7h5qe3"
#       size     = 30
#       type     = "network-hdd"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.hbf-subnet.id
#     nat = true
#   }

#   lifecycle {
#     ignore_changes = [
#       metadata
#     ]
#   }

#  metadata = {
#    user-data = "${file("templates/cloudi-init.yaml")}"
#  }
# }

# # resource "yandex_compute_instance" "team-a-frontend" {

# #   description = "HBF-TEAM-A-FRONTEND"
# #   hostname    = "frontend"
# #   name        = "frontend"
# #   platform_id = "standard-v1"

# #   zone = "ru-central1-a"

# #   resources {
# #     cores         = 2
# #     memory        = 4
# #     core_fraction = 100
# #   }

# #   boot_disk {
# #     initialize_params {
# #       image_id = "fd8kdq6d0p8sij7h5qe3"
# #       size     = 30
# #       type     = "network-hdd"
# #     }
# #   }

# #   network_interface {
# #     subnet_id = yandex_vpc_subnet.hbf-subnet.id
# #     nat = true
# #   }

# #   lifecycle {
# #     ignore_changes = [
# #       metadata
# #     ]
# #   }

# #  metadata = {
# #    user-data = "${file("templates/cloudi-init.yaml")}"
# #  }
# # }

module "firewall" {

    source = "git::https://github.com/fraima/terraform-modules//modules/charlotte?ref=main"
    security_groups = local.security_groups
    # security_rules = local.security_rules

}

# output "fucker" {
#   value = module.firewall.fucker
# }