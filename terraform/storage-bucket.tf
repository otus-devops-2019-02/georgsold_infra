provider "google" {
  version = "2.0.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.1.1"

  # Имена поменяйте на другие
  name = ["georgsold-bucket-test", "georgsold-bucket-test2"]
}

output storage-bucket_url {
  value = "${module.storage-bucket.url}"
}

module "georgsold-app-states" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.1.1"

  # Имена поменяйте на другие  
  name = ["georgsold-app-states"]
}

output georgsold-app-states_url {
  value = "${module.georgsold-app-states.url}"
}
