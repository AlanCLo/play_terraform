provider "google" {
  project = var.project
  region  = var.region
}

resource "random_string" "account_id" {
  length = 8

  special = false
  upper   = false
  lower   = true
  number  = false
}

resource "google_service_account" "test" {
  account_id   = "test-${random_string.account_id.result}"
  display_name = "Test Service Account"
}

resource "google_project_iam_binding" "test" {
  project = var.project
  role    = "roles/viewer"

  members = [
    "serviceAccount:${google_service_account.test.email}",
  ]
}
