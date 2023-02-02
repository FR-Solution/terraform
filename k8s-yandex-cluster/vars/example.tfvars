
default_zone = "ru-central1-a"
default_subnet = "10.0.0.0/24"

yandex_cloud_name = "cloud-uid-vf465ie7"

yandex_folder_name = "example"

yandex_default_vpc_name = "vpc.clusters"

yandex_default_route_table_name = "vpc-clusters-route-table"

global_vars = {
    cluster_name    = "cluster-2"
    base_domain     = "dobry-kot.ru"
    vault_server    = "http://193.32.219.99:9200/"

    service_cidr    = "29.64.0.0/16"
    pod_cidr        = "10.100.0.0/16"
    node_cidr_mask  = "24"
    
    ssh_username  = "dkot"
    ssh_rsa_path  = "~/.ssh/id_rsa.pub"
}

cloud_metadata = {
    cloud_name  = "cloud-uid-vf465ie7"
    folder_name = "example"
}

master_group = {
    name                = "master"
    count               = 1

    vpc_name            = "vpc.clusters"
    route_table_name    = "vpc-clusters-route-table"

    default_subnet      = "10.0.0.0/24"
    default_zone        = "ru-central1-a"
}