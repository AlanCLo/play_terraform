
variable "blah" {
  default = [ "1", "2", "3", "4" ]
}

resource "random_string" "hello" {
  count = 4

  length=6
  lower   = true
  upper   = false
  number  = false
  special = false
}

resource "null_resource" "echo" {
  count = 4

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "${element(random_string.hello.*.result, count.index)}"
EOT
  }
}
