terraform {
  requuired_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.9"
    }
  }
}

provider "yandex" {
  service_account_key_file = file(var.yc_cred.key_file)
  cloud_id                 = var.yc_cred.cloud_id
  folder_id                = var.yc_cred.folder_id
  zone                     = var.yc_region
}
