resource "random_string" "my_rand" {
  length  = 6
  lower   = true
  upper   = false
  number  = false
  special = false
}

# You can refernce another resource in a null_resource provisioner
# without adding it to trigger.
# 0.12 syntax requirement is that vars/locals cannot be referred
# inside a provisioner
resource "null_resource" "standalone" {
  provisioner "local-exec" {
    command = "echo hello"
  }
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
      echo "My standalone resource id: ${null_resource.standalone.id}"
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

