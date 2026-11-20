output "kms_key_id" {
  description = "Идентификатор симметричного ключа KMS"
  value       = yandex_kms_symmetric_key.bucket.id
}

output "bucket_name" {
  description = "Бакет с шифрованием по умолчанию"
  value       = yandex_storage_bucket.hw.bucket
}

output "image_url" {
  description = "Публичный URL картинки в Object Storage"
  value       = local.image_url
}
