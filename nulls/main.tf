variable "myvar" {
  default = "hello"
}

variable "special" {
  type = list(map(string))

  default = [
    {
      a = "a1",
      b = "b1"
    },
    {
      a = "a2",
      b = "b2"
    }
  ]
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
    myrand = random_string.myrand.result
    myvar  = var.myvar
    spec   = lookup(var.special[0], "a")
  }

  #myvar  = "${var.myvar}"

  provisioner "local-exec" {
    command = <<EOT
      echo "My Rand: ${self.triggers.myrand}"
      echo "My Var: ${var.myvar}"
      echo "${self.triggers.spec}"
EOT

  }
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      echo "Destroy: myvar - ${self.triggers.myvar}"
EOT

  }
}

