module "yandex-network-base-configuration" {
    source = "git::https://github.com/fraima/terraform-modules//modules/yandex-network-base?ref=main"

    cloud = {
        extra-args = {
            name        = "cloud-uid-vf465ie7"
            folder_name = "example"
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
}
