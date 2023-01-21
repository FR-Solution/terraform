cluster_name = "cluster-example"

cidr = {
    service         = "29.64.0.0/16"
    pod             = "10.12.0.0/16"
    node_cidr_mask  = "24"
}

master_availability_zones = {
    ru-central1-a = "10.161.0.0/16"
    ru-central1-b = "10.162.0.0/16"
    ru-central1-c = "10.163.0.0/16"
}