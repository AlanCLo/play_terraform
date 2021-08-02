variable "my_bool" {
  description = "My test boolean"
  # There is no bool type in 0.11. String is fine.
  # It will convert true/false to boealn 1/0 automatically
  type        = "string"
}

locals {
  my_bool = "${var.my_bool ? "It was true" : "It was false" }"
}
