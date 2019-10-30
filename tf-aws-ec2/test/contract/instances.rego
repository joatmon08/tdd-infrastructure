package main


do_not_delete = [
  "aws_instance.db",
]

deny[msg] {
  check_delete_protected(input.resource_changes, do_not_delete)
  warning := concat(", ", do_not_delete)
  msg = sprintf("Terraform plan will delete resources: %v", [warning])
}

check_delete_protected(resources, disallowed) {
  startswith(resources[_].address, disallowed[_])
  resources[_].change[0].actions[_] == "destroy"
}