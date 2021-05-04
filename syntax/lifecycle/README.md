
Lifecycle             | Outcome |
--------------------- | ------- |
Default (nothing)     | Destroy then create |
create_before_destroy | Create, then destroy...but it actually is a replace. `when = destroy` does not Trigger (TF v0.12) |
prevent_destroy       | plan/apply errors |
ignore_changes        | Can block the triggers entirelly |