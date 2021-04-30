resource "random_string" "my_count" {
  count = "${var.num_items}"

  length  = 6
  lower   = true
  upper   = false
  number  = false
  special = false
}

resource "null_resource" "echo" {
  count = "${var.num_items}"

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "${element(random_string.my_count.*.result, count.index)}"
EOT
  }
}
