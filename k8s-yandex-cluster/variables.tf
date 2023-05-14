variable "global_vars" {
  type = any
}

variable "cloud_metadata" {
  type = any
}

variable "yandex_cloud_controller_sa_name" {
  type = string
  default = "k8s-cloud-controller"
}