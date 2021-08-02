
data "terraform_remote_state" "parent" {
  backend = "local"

  config = {
    path = "../terraform.tfstate"
  }
}

resource "null_resource" "make_if_one" {
  count = "${data.terraform_remote_state.parent.do_one == "" ? 0 : 1}"
}

resource "null_resource" "dont_make_if_none" {
  count = "${data.terraform_remote_state.parent.do_none == "" ? 0 : 1}"
}

output "parent_do_one" {
  value = "${data.terraform_remote_state.parent.do_one}"
}

output "make_if_one" {
  value = "${join("", null_resource.make_if_one.*.id)}"
}

output "dont_make_if_none" {
  value = "${join("", null_resource.dont_make_if_none.*.id)}"
}
