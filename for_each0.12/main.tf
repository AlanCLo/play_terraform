
variable "my_items" {
  description = "blah"
  type        = map(string)

  default = {
    "a" = "abcd",
    "b" = "bcde",
    "c" = "cdef"
  }
}

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

variable "more_items" {
  description = "blah blah"
  type        = list(map(string))

  default = [
    {
      "a" = "1",
      "b" = "2"
    },
    {
      "a" = "3",
      "b" = "4"
    }
  ]
}

locals {
  my_test = join("-", [ for k, v in var.my_items : "${k}-${v}" ],)
  my_mapmap = { for thing in var.more_items : join("-", [for k, v in thing : "${k}-${v}"]) => thing }
}

output "my_test" {
  value = local.my_test
}


output "mapmap" {
  value = local.my_mapmap
}
