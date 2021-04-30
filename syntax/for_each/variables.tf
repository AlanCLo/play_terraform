
variable "my_items" {
  description = "Map of items"
  type        = map(string)

  default = {
    "a" = "abcd",
    "b" = "bcde",
    "c" = "cdef"
  }
}

variable "more_items" {
  description = "List map of items"
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
  test_join_string    = join("-", [for k, v in var.my_items : "${k}-${v}"], )
  convert_list_to_map = { for thing in var.more_items : join("-", [for k, v in thing : "${k}-${v}"]) => thing }
}

