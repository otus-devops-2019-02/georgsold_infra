terraform {
  backend "gcs" {
    bucket = "georgsold-app-states"
    prefix = "terraform/states/prod"
  }
}
