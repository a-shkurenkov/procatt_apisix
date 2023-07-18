variable "yc_cred" {
  description = "Yandex Cloud credentials"
  type        = map
}

variable "yc_region" {
  type    = string
  default = "ru-central1-a"
}

variable "yc_k8s_ver" {
  type    = string
  default = "1.27"
}
