resource "yandex_kms_symmetric_key" "bucket" {
  name              = "hw03-bucket"
  description       = "SSE-KMS key for the hw02 bucket"
  default_algorithm = "AES_256"
  folder_id         = var.folder_id
}
