resource "yandex_iam_service_account_static_access_key" "storage" {
  service_account_id = local.terraform_sa_id
  description        = "Object Storage key for hw03"
}

resource "yandex_storage_bucket" "hw" {
  bucket     = var.bucket_name
  folder_id  = var.folder_id
  access_key = yandex_iam_service_account_static_access_key.storage.access_key
  secret_key = yandex_iam_service_account_static_access_key.storage.secret_key

  default_storage_class = "STANDARD"
  force_destroy         = true

  anonymous_access_flags {
    read = true
    list = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "image" {
  bucket       = yandex_storage_bucket.hw.bucket
  key          = "images.jpeg"
  source       = "${path.module}/../../hw02/images/images.jpeg"
  acl          = "public-read"
  access_key   = yandex_iam_service_account_static_access_key.storage.access_key
  secret_key   = yandex_iam_service_account_static_access_key.storage.secret_key
  content_type = "image/jpeg"

  depends_on = [yandex_storage_bucket.hw]
}
