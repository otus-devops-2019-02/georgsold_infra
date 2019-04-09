terraform {
  # Версия terraform  # required_version = "0.11.7"
  backend "gcs" {
    bucket = "georgsold-app-states"
    prefix = "terraform/states/stage"
  }
}
