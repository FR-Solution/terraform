cluster_name = "cluster-example"

cidr = {
    service         = "29.64.0.0/16"
    pod             = "10.13.0.0/16"
    node_cidr_mask  = "24"
}

master_availability_zones = {
    ru-central1-a = "10.3.1.0/24"
    ru-central1-b = "10.3.2.0/24"
    ru-central1-c = "10.3.3.0/24"
}