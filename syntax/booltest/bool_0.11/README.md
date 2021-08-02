
https://www.terraform.io/docs/configuration-0-11/variables.html

Terraform docs recommends to use "true" / "false" for booleans in 0.11

Findings
* The type is "string".
* When evalated in a ?: operation, it will parse and type check "true"/"false"
