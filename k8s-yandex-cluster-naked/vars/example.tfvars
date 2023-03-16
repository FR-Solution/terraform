global_vars = {
    cluster_name    = "example"
    pod_cidr        = "10.102.0.0/16"

    serviceaccount_k8s_controllers_name = "yandex-k8s-controllers"

    kube_apiserver_flags = {
        oidc-issuer-url = "https://auth.dobry-kot.ru/auth/realms/master"
        oidc-client-id  = "kubernetes-clusters"
    }
    kube_controller_manager_flags = {
        cluster-name = "kubernetes"
    }
    kube_scheduler_flags = {
        
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
