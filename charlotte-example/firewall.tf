locals {
    cluster_name = "example"

    security_groups  = [

        {
            name = "infra/hbf-server"
            cidrs = [
                "193.32.219.99/32",
            ]
            rules = []
        },
        {
            name = "infra/dns"
            cidrs = [
                "10.0.0.2/32",
            ]
            rules = []
        },
        {
            name = "test/yandex"
            cidrs = [
                "5.255.255.242/32",
                "77.88.55.242/32",
            ]
            rules = []
        },

    ]
}

locals {
    hosts = 1024
    network_mask = 22
    networks = flatten([
        for i in range(local.hosts):
            {"${substr(sha256(cidrhost("10.102.0.0/${local.network_mask}", i)), 0, 10)}": {
                cidr: cidrhost("10.102.0.0/${local.network_mask}", i)
                }
            }
    ])
    networks_map = { for item in local.networks :
      keys(item)[0] => values(item)[0]
    }
    rules_client = flatten([
        for src in range(local.hosts):
            flatten([for dst in range(local.hosts):
                "${substr(sha256(cidrhost("10.102.0.0/${local.network_mask}", src)), 0, 10)}:${substr(sha256(cidrhost("10.102.0.0/${local.network_mask}", dst)), 0, 10)}"
            ])
    ])
    
    rules_to_hbf = flatten([
        for key, value in local.networks_map:
            "${key}:infra/hbf-server"
    ])

    rules_map = { for item in concat(local.rules_client, local.rules_to_hbf) :
      item => {}
    }
}

output "name" {
  value = length(local.rules_client)
}

resource "sgroups_network" "networks" {
  for_each = local.networks_map

  name    = each.key
  cidr    = "${each.value.cidr}/32"

}
resource "sgroups_group" "groups" {
    for_each    = sgroups_network.networks

    name        = each.value.name
    networks    = each.value.name
}


resource "sgroups_rule" "rules" {
  depends_on = [
    sgroups_group.groups,
  ]


    for_each = local.rules_map

    proto       = "tcp"
    sg_from     = split(":",each.key)[0]
    sg_to       = split(":",each.key)[1]
    ports_from  = null
    ports_to    = "80 443"

}
