locals {
  # Ключ из providers.tf не может менять IAM каталога, поэтому бакет
  # использует тот же сервисный аккаунт, что и в hw02.
  terraform_sa_id = jsondecode(file("~/.authorized_key.json")).service_account_id
  image_url       = "https://storage.yandexcloud.net/${var.bucket_name}/images.jpeg"
}
