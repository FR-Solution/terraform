global_vars = {
    cluster_name    = "example"
    pod_cidr        = "10.102.0.0/16"
    cilium = {
        cluster_id = 10
    }
        
}

cloud_metadata = {
    cloud_name  = "cloud-uid-vf465ie7"
    folder_name = "example"
}

master_group = {
    name                = "master"
    count               = 1

    default_subnet      = "10.0.0.0/24"
    default_zone        = "ru-central1-a"
}
