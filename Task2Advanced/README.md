# Terraform CI/CD с удалённым состоянием

## О проекте

Этот проект демонстрирует автоматизацию развёртывания инфраструктуры с использованием:
- Terraform с модульной архитектурой
- Удалённое состояние в S3-совместимом хранилище (Yandex Object Storage)
- CI/CD пайплайн на GitHub Actions
- Изоляция окружений (dev, stage, prod)

## Настройка

### 1. Подготовка Yandex Cloud

1. Создайте облако и каталог в Yandex Cloud
2. Создайте Service Account с правами:
   - `editor` на каталог
   - доступ к Object Storage
3. Создайте статические ключи доступа для S3

### 2. Настройка Object Storage

1. Создайте бакет для хранения состояния:
   ```bash
   aws s3api create-bucket \
     --bucket terraform-state-<your-org> \
     --endpoint-url https://storage.yandexcloud.net \
     --region ru-central1

2. Включите версионирование:
    ```bash 
  aws s3api put-bucket-versioning \
    --bucket terraform-state-<your-org> \
    --endpoint-url https://storage.yandexcloud.net \
    --versioning-configuration Status=Enabled
  

### 3. Настройка Secrets в GitHub

Добавьте следующие секреты в GitHub Repository → Settings → Secrets:

| Секрет | Описание |
|--------|----------|
| `CLOUD_ID` | ID облака Yandex Cloud |
| `FOLDER_ID` | ID каталога Yandex Cloud |
| `S3_ACCESS_KEY` | Access key для Object Storage |
| `S3_SECRET_KEY` | Secret key для Object Storage |
| `SUBNET_ID` | ID подсети для ВМ |
| `SSH_KEY` | SSH-ключ для доступа к ВМ |
| `SLACK_WEBHOOK_URL` | (Опционально) Webhook для уведомлений |
