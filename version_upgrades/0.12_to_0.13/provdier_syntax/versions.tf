
terraform {
  # TEST: Not using required_providers block that specifies vendor/provider
  #       But using 0.13 terraform
  required_version = ">= 0.12"
}

provider "google" {
  # What 0.12 providers would do to spec version
  version = ">= 3.0.0"
}
