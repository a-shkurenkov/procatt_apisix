terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.9"
    }
  }
}

provider "yandex" {
  token      = var.yc_cred.token
  cloud_id   = var.yc_cred.cloud_id
  folder_id  = var.yc_cred.folder_id
  zone       = var.yc_region
}
