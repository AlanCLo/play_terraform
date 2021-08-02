
https://www.terraform.io/docs/configuration-0-11/variables.html

Refer to ../bool_011

This is after `terraform 0.12upgrade`

Findings
* The syntax in 0.11 is forward compatible as per documentation
* You can keep `type=string` if you like
* You can change to `type=bool` as well. It will still work with "true" / "false" values that are set anywhere
