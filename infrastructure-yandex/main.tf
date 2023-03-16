module "yandex-network-base-configuration" {
    source = "git::https://github.com/fraima/terraform-modules//modules/yandex-network-base?ref=main"

    cloud = {
        extra-args = {
            name        = "cloud-uid-vf465ie7"
            folder_name = "example"
        }
    }
    vpc = {
        extra-args = {
            name = "vpc.clusters"
        }
    }
    route-table = {
        extra-args = {
            name = "vpc-clusters-route-table"
        }
    }
}

module "yandex-k8s-base-configuration" {
    source = "git::https://github.com/fraima/terraform-modules//modules/k8s-yandex-base?ref=main"

    cloud = {
        extra-args = {
            name        = "cloud-uid-vf465ie7"
            folder_name = "example"
        }
    }
    k8s-service-account = {
        extra-args = {
            name        = "yandex-k8s-controllers"
        }  
    }
}
