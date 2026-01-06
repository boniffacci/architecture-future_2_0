terraform {
  backend "s3" {
    endpoint                    = "https://storage.yandexcloud.net"
    bucket                      = "terraform-state-myproject"
    key                         = "dev/terraform.tfstate"
    region                      = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    
    access_key = var.s3_access_key
    secret_key = var.s3_secret_key
  }
}