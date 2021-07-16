

resource "null_resource" "the_for" {
  for_each = var.my_items

  triggers = {
    always = timestamp()
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "My item is: ${each.key} ${each.value}"
EOT
  }
}

resource "null_resource" "linked_for" {
  for_each = var.my_items

  triggers = {
    always = timestamp()
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "linked to: ${null_resource.the_for[each.key].id}"
EOT
  }
}


resource "null_resource" "empty_test" {
  for_each = var.empty_list

  provisioner "local-exec" {
    command = "echo this should never exec"
  }
}
