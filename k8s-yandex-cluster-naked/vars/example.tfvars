global_vars = {
    cluster_name    = "example"
    pod_cidr        = "10.102.0.0/16"

    firewall = {
        enabled = false
    }

    serviceaccount_k8s_controllers_name = "yandex-k8s-controllers"

    kube_apiserver_flags = {
        oidc-issuer-url         = "https://auth.dobry-kot.ru/auth/realms/master"
        oidc-client-id          = "kubernetes-clusters"
        oidc-username-claim     = "sub"
        oidc-groups-claim       = "groups"
        oidc-username-prefix    = "-"
    }
    kube_controller_manager_flags = {
        cluster-name = "kubernetes"
    }
    kube_scheduler_flags = {
        
    }

    addons = {
        cilium = {
            enabled = true
            extra_values = {
                cluster = {
                    name = "example"
                    id = 12
                }
            }
        }

        vault-issuer = {
            enabled = true
            extra_values = {}
        }

        coredns = {
            enabled = true
            extra_values = {}
        }

        gatekeeper = {
            enabled = true
            extra_values = {}
        }

        certmanager = {
            enabled = true
            extra_values = {}
        }

        machine-controller-manager = {
            enabled = true
            extra_values = {}
        }

        yandex-cloud-controller = {
            enabled = true
            extra_values = {}
        }

        yandex-csi-controller = {
            enabled = true
            extra_values = {}
        }

        compute-instance = {
            enabled = true
            custom_values = {
                subnet_id   = "e9bndv0b3c5asheadg09"
                zone        = "ru-central1-a"
                image_id    = "fd8ingbofbh3j5h7i8ll"
                replicas    = 1
            }
            extra_values = {
                metadata = {
                    nodeLabels = {
                        "node-role.kubernetes.io/treska" = ""
                        "provider" = "yandex"    
                    }
                    cloudLabels = {
                        tair = "critical"
                    }
                }
            }
        }
    }

}

cloud_metadata = {
    cloud_name  = "cloud-uid-vf465ie7"
    folder_name = "example"
}

master_group = {
    name                = "master"
    count               = 3

    default_subnet      = "10.0.0.0/24"
    default_zone        = "ru-central1-a"

    metadata = {
        # user_data_template = "fraima-hbf"
        user_data_template = "fraima"
    }
}
