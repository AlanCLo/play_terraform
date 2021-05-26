variable workspace_map {
  description = "Map of workspace name to number of things to make"
  type        = map(number)
  default = {
    default = 2
    dev     = 1
    prod    = 5
  }
}

locals {
  num = lookup(var.workspace_map, terraform.workspace, 10)
}
