
resource "null_resource" "do_one" {
  count = 1
}

resource "null_resource" "do_many" {
  count = 3
}

resource "null_resource" "do_none" {
  count = 0
}

module "more_nothing" {
  source = "modules/nothing"
}

output "do_one" {
  value = "${join(",", null_resource.do_one.*.id)}"
}

output "do_many" {
  value = "${join(",", null_resource.do_many.*.id)}"
}

output "do_none" {
  value = "${join(",", null_resource.do_none.*.id)}"
}

output "nothing_module" {
  value = "${module.more_nothing.nothing_id}"
}


