output "vm_id" {
  value       = yandex_compute_instance.vm.id
  description = "ID виртуальной машины"
}

output "vm_name" {
  value       = yandex_compute_instance.vm.name
  description = "Имя виртуальной машины"
}

output "private_ip" {
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
  description = "Внутренний IP-адрес"
}

output "public_ip" {
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
  description = "Внешний IP-адрес"
}

output "disk_id" {
  value       = yandex_compute_disk.additional_disk.id
  description = "ID дополнительного диска"
}

output "disk_name" {
  value       = yandex_compute_disk.additional_disk.name
  description = "Имя дополнительного диска"
}

output "fqdn" {
  value       = yandex_compute_instance.vm.fqdn
  description = "Полное доменное имя"
}