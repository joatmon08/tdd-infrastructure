package main

region := "us-east-2"
owner := "rosemary"

contains_variables(variables) {
  variables.vpc_cidr.value = "10.128.0.0/25"
  variables.region.value = region
  variables.owner
}

deny[msg] {
  not contains_variables(input.variables)
  msg = "Variables are not populated with expected values"
}

deny[msg] {
  subnets := [r | r := input.planned_values.root_module.resources[_]; r.address == "aws_subnet.private"]
  subnets[0].values.cidr_block != "10.128.0.32/28"
  msg = sprintf("Private subnet has wrong CIDR: `%v`", [subnets])
}

deny[msg] {
  subnets := [r | r := input.planned_values.root_module.resources[_]; r.type == "aws_subnet"]
  wrong_subnets := [r | r := subnets[_]; not startswith(r.values.availability_zone, region)]
  msg = sprintf("subnet has wrong availability zone: `%v`", [wrong_subnets[_]])
}

deny[msg] {
  subnets := [r | r := input.planned_values.root_module.resources[_]; r.address == "aws_subnet.public"]
  subnets[0].values.cidr_block != "10.128.0.0/28"
  msg = sprintf("Public subnet has wrong CIDR: `%v`", [subnets])
}

deny[msg] {
  untagged := [r | r := input.planned_values.root_module.resources[_]; r.values.tags.Owner != owner ]
  count(untagged) != 0
  msg = sprintf("Resources missing owner tag: `%v`", untagged)
}