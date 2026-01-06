variable "vm_name" {
  type        = string
  description = "Имя виртуальной машины"
}

variable "environment" {
  type        = string
  description = "Окружение (dev, stage, prod)"
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

variable "image_id" {
  type        = string
  description = "ID образа операционной системы"
  default     = "fd80mrhj8fl2oe87o4e1" # Ubuntu 22.04 LTS
}

variable "labels" {
  type        = map(string)
  description = "Метки ресурсов"
  default     = {}
}