variable "cloud_id" {
  type        = string
  description = "ID облака Yandex Cloud"
}

variable "folder_id" {
  type        = string
  description = "ID каталога Yandex Cloud"
}

variable "vm_name" {
  type        = string
  description = "Имя виртуальной машины"
  default     = "my-vm"
}

variable "cpu_count" {
  type        = number
  description = "Количество ядер CPU"
  default     = 2
}

variable "ram_size" {
  type        = number
  description = "Объем оперативной памяти в ГБ"
  default     = 4
}

variable "disk_size" {
  type        = number
  description = "Размер подключаемого диска в ГБ"
  default     = 20
}

variable "subnet_id" {
  type        = string
  description = "ID подсети"
}

variable "ssh_key" {
  type        = string
  description = "SSH-ключ для доступа к ВМ"
  sensitive   = true
}

variable "zone" {
  type        = string
  description = "Зона доступности"
  default     = "ru-central1-a"
}

variable "labels" {
  type        = map(string)
  description = "Метки ресурсов"
  default = {
    app        = "myapp"
    department = "development"
  }
}