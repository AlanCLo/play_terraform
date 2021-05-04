resource "null_resource" "test_default" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo [default] Creating"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo [default] Destorying"
  }
}

resource "null_resource" "test_create_before_destroy" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo [create_before_destroy] Creating"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo [create_before_destroy] Destorying"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "null_resource" "test_prevent_destroy" {
  triggers = {
    always_run = "${timestamp()}"
  }

  ## Un-comment to see plan/apply flag an error
  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "null_resource" "ignore_changes" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo [ignore_changes] Creating"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo [ignore_changes] Destorying"
  }

  # This won't be triggered on subsequent runs after creation
  lifecycle {
    ignore_changes = [triggers]
  }
}