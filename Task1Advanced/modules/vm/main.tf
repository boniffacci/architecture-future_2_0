# Создание виртуальной машины
resource "yandex_compute_instance" "vm" {
  name        = "${var.vm_name}-${var.environment}"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores         = var.cpu_count
    memory        = var.ram_size
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10 # Минимальный размер системного диска
    }
  }

  # Подключаемый диск
  secondary_disk {
    disk_id = yandex_compute_disk.additional_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true # Включаем внешний IP
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }

  labels = merge(var.labels, {
    environment = var.environment
    managed-by  = "terraform"
  })
}

# Создание дополнительного диска
resource "yandex_compute_disk" "additional_disk" {
  name     = "${var.vm_name}-disk-${var.environment}"
  type     = "network-hdd"
  zone     = var.zone
  size     = var.disk_size

  labels = merge(var.labels, {
    environment = var.environment
    managed-by  = "terraform"
  })
}