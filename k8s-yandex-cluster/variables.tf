
variable "cluster_name" {
  type = string
  default = "default"
}

variable "base_domain" {
  type = string
  default = "dobry-kot.ru"
}

variable "master_availability_zones"{
  type = object({
    ru-central1-a = string
    ru-central1-b = string
    ru-central1-c = string
  })
  default = {
    ru-central1-a = "10.1.0.0/16"
    ru-central1-b = "10.2.0.0/16"
    ru-central1-c = "10.3.0.0/16"
  }
}

variable "master_group" {
  type = object({
    count         = optional(string, "")

  })
  default = {
    count   = "1"

  }
}


variable "cidr" {
  type = object({
    service         = optional(string, "")
    pod             = optional(string, "")
    node_cidr_mask  = optional(string, "")
  })
  default = {
    service   = "172.16.0.0/16"
    pod       = "10.100.0.0/16"
    node_cidr_mask = "24"
  }
}

variable "VAULT_ADDR" {
  default = ""
}

variable "VAULT_TOKEN" {
  default = ""
}

variable "YC_FOLDER_ID" {
  type = string
  default = ""
}

variable "YC_ZONE" {
  type = string
  default = ""
}

variable "YC_CLOUD_ID" {
  type = string
  default = ""
}

variable "YC_TOKEN" {
  type = string
  default = ""
}
