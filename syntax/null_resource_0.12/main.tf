resource "random_string" "my_rand" {
  length  = 6
  lower   = true
  upper   = false
  number  = false
  special = false
}

resource "null_resource" "test_null" {
  triggers = {
    my_rand     = random_string.my_rand.result
    my_variable = var.my_variable
  }

  ### Cannot do this
  # echo "My Rand (resource ref): ${random_string.my_rand.result}"
  provisioner "local-exec" {
    command = <<EOT
      echo "My Rand (self.trigger): ${self.triggers.my_rand}"
      echo "My Var: ${self.triggers.my_variable}"
EOT

  }

  ### Cannot do this
  # echo "(Destroy) My Rand (resource ref): ${random_string.my_rand.result}"
  provisioner "local-exec" {
    when = destroy

    command = <<EOT
      echo "(Destroy) My Rand (self.trigger): ${self.triggers.my_rand}"
      echo "(Destroy) My Var: ${self.triggers.my_variable}"
EOT

  }
}

