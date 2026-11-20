variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "b1g51e8snmd071om17j0"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "b1gkfhvrdn8er82j6v3s"
}

variable "zone" {
  type        = string
  default     = "ru-central1-d"
  description = "Зона по умолчанию для провайдера"
}

variable "bucket_name" {
  type        = string
  default     = "ksokolov-hw02-20261119"
  description = "Бакет Object Storage из hw02"
}
