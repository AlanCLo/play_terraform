provider "google" {
  project = var.project
  region  = var.region
}

resource "google_project_iam_audit_config" "test" {
  project = var.project
  service = "allServices"

  audit_log_config {
    log_type = "DATA_READ"
  }
}
