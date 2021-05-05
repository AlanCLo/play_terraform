Testing the interaction when iam_binding and iam_member is mixed and changed over.

# Tests

Method: 
* Setup inital states and then make changes
* Obvserve result on https://console.cloud.google.com/iam-admin/iam?project=(the project)


Initial Member State | Initial Binding State | The Change | Result | Comment |
-------------- | --------------- | ------ | ------ | ------- |
role/viewer    | none            | Add Binding role/editor | Viewer + Editor | Merge behaviour |
role/viewer    | role/editor     | Destroy Member | Editor remains | Drops as expected |
role/editor    | none            | Add Binding role/viewer | Viewer + Editor | Same merge behaviour |
role/editor    | role/viewer     | Destroy Binding | Editor remains | Drops as expected; Role power does not matter |
role/viewer    | role/viewer     | Destroy Member | Role lost even though binding still exists | Solutions: 1) taint binding & re-apply or 2) state rm iam_member first to prevent destroy trigger |
