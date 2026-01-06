#!/bin/bash
set -e

# Проверка переменных окружения
: "${S3_ENDPOINT:?Не задана S3_ENDPOINT}"
: "${S3_BUCKET:?Не задано имя S3_BUCKET}"
: "${S3_ACCESS_KEY:?Не задан S3_ACCESS_KEY}"
: "${S3_SECRET_KEY:?Не задан S3_SECRET_KEY}"

echo "Настройка S3-бакета для Terraform state..."

# Создание конфигурации для AWS CLI (совместимо с Yandex Object Storage)
cat > ~/.aws/config <<EOF
[default]
region = ru-central1
output = json
EOF

cat > ~/.aws/credentials <<EOF
[default]
aws_access_key_id = ${S3_ACCESS_KEY}
aws_secret_access_key = ${S3_SECRET_KEY}
EOF

# Проверка доступности S3 хранилища
echo "Проверка доступности S3 хранилища..."
if ! aws --endpoint-url=${S3_ENDPOINT} s3 ls; then
  echo "Ошибка: Не удалось подключиться к S3 хранилищу"
  exit 1
fi

# Создание бакета если не существует
echo "Проверка существования бакета ${S3_BUCKET}..."
if aws --endpoint-url=${S3_ENDPOINT} s3api head-bucket --bucket "${S3_BUCKET}" 2>/dev/null; then
  echo "Бакет ${S3_BUCKET} уже существует"
else
  echo "Создание бакета ${S3_BUCKET}..."
  aws --endpoint-url=${S3_ENDPOINT} s3api create-bucket \
    --bucket "${S3_BUCKET}" \
    --region ru-central1
  
  # Включение версионирования для бакета
  echo "Включение версионирования для бакета..."
  aws --endpoint-url=${S3_ENDPOINT} s3api put-bucket-versioning \
    --bucket "${S3_BUCKET}" \
    --versioning-configuration Status=Enabled
  
  # Настройка шифрования
  echo "Настройка шифрования SSE-S3..."
  aws --endpoint-url=${S3_ENDPOINT} s3api put-bucket-encryption \
    --bucket "${S3_BUCKET}" \
    --server-side-encryption-configuration '{
      "Rules": [
        {
          "ApplyServerSideEncryptionByDefault": {
            "SSEAlgorithm": "AES256"
          }
        }
      ]
    }'
  
  echo "Бакет ${S3_BUCKET} успешно создан и настроен"
fi

# Создание структуры папок для разных окружений
for env in dev stage prod; do
  echo "Создание структуры для окружения ${env}..."
  
  # Создание папки окружения
  aws --endpoint-url=${S3_ENDPOINT} s3api put-object \
    --bucket "${S3_BUCKET}" \
    --key "${env}/" \
    --content-length 0
  
  # Создание папки для locks
  aws --endpoint-url=${S3_ENDPOINT} s3api put-object \
    --bucket "${S3_BUCKET}" \
    --key "${env}/locks/" \
    --content-length 0
done

echo "Настройка S3 backend завершена успешно!"