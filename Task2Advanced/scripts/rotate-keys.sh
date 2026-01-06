#!/bin/bash
set -e

# Скрипт для ротации ключей S3
: "${S3_ENDPOINT:?Не задана S3_ENDPOINT}"
: "${S3_BUCKET:?Не задано имя S3_BUCKET}"
: "${OLD_S3_ACCESS_KEY:?Не задан OLD_S3_ACCESS_KEY}"
: "${OLD_S3_SECRET_KEY:?Не задан OLD_S3_SECRET_KEY}"
: "${NEW_S3_ACCESS_KEY:?Не задан NEW_S3_ACCESS_KEY}"
: "${NEW_S3_SECRET_KEY:?Не задан NEW_S3_SECRET_KEY}"

echo "Начало ротации ключей S3..."

# Миграция состояния с использованием старого и нового ключей
for env in dev stage prod; do
  echo "Миграция состояния для окружения ${env}..."
  
  # Скачивание текущего состояния
  AWS_ACCESS_KEY_ID=${OLD_S3_ACCESS_KEY} \
  AWS_SECRET_ACCESS_KEY=${OLD_S3_SECRET_KEY} \
    aws --endpoint-url=${S3_ENDPOINT} s3 cp \
    "s3://${S3_BUCKET}/${env}/terraform.tfstate" \
    "/tmp/${env}.tfstate"
  
  # Загрузка состояния с новыми ключами
  AWS_ACCESS_KEY_ID=${NEW_S3_ACCESS_KEY} \
  AWS_SECRET_ACCESS_KEY=${NEW_S3_SECRET_KEY} \
    aws --endpoint-url=${S3_ENDPOINT} s3 cp \
    "/tmp/${env}.tfstate" \
    "s3://${S3_BUCKET}/${env}/terraform.tfstate"
  
  echo "Состояние для ${env} успешно мигрировано"
done

echo "Ротация ключей завершена. Не забудьте обновить секреты в CI/CD!"