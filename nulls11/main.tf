variable "myvar" {
  default = "hello"
}

resource "random_string" "myrand" {
  length  = 6
  lower   = true
  upper   = false
  number  = false
  special = false
}

resource "null_resource" "testnull" {
  triggers = {
    myrand = "${random_string.myrand.result}"
    #myvar  = "${var.myvar}"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "My Rand: ${self.triggers.myrand}"
      echo "My Var: ${var.myvar}"
EOT
  }
  provisioner "local-exec" {
    when = "destroy"
    command = <<EOT
      echo "Destroy: myvar - ${var.myvar}"
EOT
  }
#echo "My Var: ${self.triggers.myvar}"
}

