resource "yandex_kubernetes_cluster" "kuber-cluster" {
  name        = "kub-test"

  network_id = yandex_vpc_network.internal.id

  master {
    zonal {
      zone      = yandex_vpc_subnet.internal-a.zone
      subnet_id = yandex_vpc_subnet.internal-a.id
    }

    version   = var.yc_k8s_ver
    public_ip = true
  }

  release_channel = "RAPID"
  network_policy_provider = "CALICO"

  node_service_account_id = yandex_iam_service_account.docker-registry.id
  service_account_id      = yandex_iam_service_account.instances-editor.id
}

resource "yandex_kubernetes_node_group" "node-group-0" {
  cluster_id  = yandex_kubernetes_cluster.kuber-cluster.id
  name        = "test-group-auto"
  version     = var.yc_k8s_ver

  instance_template {
    platform_id = "standard-v1"

    network_interface {
      nat        = true
      subnet_ids = [yandex_vpc_subnet.internal-a.id]
    }

    resources {
      core_fraction = 20
      memory        = 2
      cores         = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 30
    }

    scheduling_policy {
      preemptible = false
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    auto_scale {
      initial = 2
      min     = 2
      max     = 3
    }
  }

  allocation_policy {
    location {
      zone = var.yc_region
    }
  }

  maintenance_policy {
    auto_upgrade = false
    auto_repair  = true
  }
}
