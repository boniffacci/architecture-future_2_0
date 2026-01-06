terraform {
  required_version = ">= 1.0"
  
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.113"
    }
  }
  
  # Блокировка состояния
  backend "s3" {
    endpoint                    = "https://storage.yandexcloud.net"
    bucket                      = "terraform-state-myproject"
    key                         = "dev/terraform.tfstate"
    region                      = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    
    # Динамическое состояние блокировки
    dynamodb_endpoint           = "https://docapi.serverless.yandexcloud.net"
    dynamodb_table              = "terraform-locks"
    encrypt                     = true
    
    # Ключи из переменных
    access_key = var.s3_access_key
    secret_key = var.s3_secret_key
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
  service_account_key_file = var.service_account_key_file
  storage_access_key       = var.s3_access_key
  storage_secret_key       = var.s3_secret_key
}

# Создание сервисного аккаунта для Terraform (опционально)
resource "yandex_iam_service_account" "terraform" {
  name        = "terraform-${terraform.workspace}"
  description = "Service account for Terraform"
}

module "vm" {
  source = "../../modules/vm"

  vm_name     = var.vm_name
  environment = terraform.workspace
  cpu_count   = var.cpu_count
  ram_size    = var.ram_size
  disk_size   = var.disk_size
  subnet_id   = var.subnet_id
  ssh_key     = var.ssh_key
  zone        = var.zone
  labels      = var.labels
  
  # Использование сервисного аккаунта
  service_account_id = yandex_iam_service_account.terraform.id
}