global_vars = {
    cluster_name    = "hbf-demo"

    pod_cidr        = "10.103.0.0/22"
    node_cidr_mask  = "24"

    serviceaccount_k8s_controllers_name = "yandex-k8s-controllers"

    firewall = {
        enabled = true
    }

    base_versions = {
        kubernetes_version = "v1.23.12"
    }
    component_versions = {
        
        bin = {
            containerd = {
                bin_url     = "https://github.com/containerd/containerd/releases/download/v1.6.6/containerd-1.6.6-linux-amd64.tar.gz"
                sha256_url  = "https://github.com/containerd/containerd/releases/download/v1.6.6/containerd-1.6.6-linux-amd64.tar.gz.sha256sum"
            }
        }
        static_pod = {
            etcd = {
                version = "3.5.3-0"
            }
        }
    }

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
            enabled = false
            extra_values = {
                cluster = {
                    name = "example"
                    id = 12
                }
            }
        }

        vault-issuer = {
            enabled = false
            extra_values = {}
        }

        coredns = {
            enabled = false
            extra_values = {}
        }

        gatekeeper = {
            enabled = false
            extra_values = {}
        }

        certmanager = {
            enabled = false
            extra_values = {}
        }

        machine-controller-manager = {
            enabled = false
            extra_values = {}
        }

        yandex-cloud-controller = {
            enabled = false
            release = {
                chart_version = "0.0.8"
            }
            module_values = {
                yandex_cloud_controller_sa_name = "k8s-cloud-controller"
            }
            extra_values = {}
        }

        yandex-csi-controller = {
            enabled = false
            module_values = {
                yandex_cloud_controller_sa_name = "k8s-csi-controller"
            }
            extra_values = {}
        }

        victoria-metrics-stack = {
            enabled = false
            extra_values = {}
        }

        compute-instance = {
            enabled = false
            module_values = {
                subnet_id   = "e9bndv0b3c5asheadg09"
                zone        = "ru-central1-a"
                image_id    = "fd8ingbofbh3j5h7i8ll"
                replicas    = 1
            }
            release = {
                chart_version = "0.1.14"
            }
            extra_values = {
                resources = {
                    coreFraction = 100
                    cores        = 16
                    memory       = 16
                }
                metadata = {
                    nodeLabels = {
                        "node-role.kubernetes.io/worker" = ""
                        "provider" = "yandex"    
                    }
                    cloudLabels = {
                        tair = "critical"
                    }
                }
            }
        }
    }

    master_group = {
        name                = "master"
        count               = 1

        default_subnet      = "10.0.0.0/24"
        default_zone        = "ru-central1-a"

        metadata = {
            user_data_template = "fraima-hbf"
        }
    }

}

cloud_metadata = {
    cloud_name  = "cloud-uid-vf465ie7"
    folder_name = "example"
}

