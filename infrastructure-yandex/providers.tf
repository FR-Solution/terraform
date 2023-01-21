terraform {

  backend "local" {
    workspace_dir = "states"
  }

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.81.0"
    }
  }
  required_version = ">= 0.13"

}

provider "yandex" {
  token     = var.YC_TOKEN
  cloud_id  = var.YC_CLOUD_ID
  folder_id = var.YC_FOLDER_ID
  zone      = var.YC_ZONE
}
