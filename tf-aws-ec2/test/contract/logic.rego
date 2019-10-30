package main

contains_variables(variables) {
  variables[_].vpc_cidr[0].value = "10.128.0.0/25"
  variables[_].region[0].value = "eu-central-1"
  variables[_].owner[0]
}

contains_cidr(resources, resource, cidr) {
  resources[i].address = resource
  resources[i].values[0].cidr_block = cidr
}

contains_availability_zone(resources, resource, region) {
  resources[i].address = resource
  contains(resources[i].values[0].availability_zone, region)
}

contains_owner_tag(resources, owner) {
  tags := resources[i].values[0].tags[0]
  tags.Owner == owner
}

deny[msg] {
  not contains_variables(input.variables)
  msg = "Variables are not populated with expected values"
}

deny[msg] {
  not contains_cidr(input.planned_values[0].root_module[0].resources, "aws_subnet.private", "10.128.0.16/28")
  msg = "Private subnet has wrong CIDR"
}

deny[msg] {
  not contains_availability_zone(input.planned_values[0].root_module[0].resources, "aws_subnet.private", "eu-central-1")
  msg = "Private subnet has wrong availability zone"
}

deny[msg] {
  not contains_cidr(input.planned_values[0].root_module[0].resources, "aws_subnet.public", "10.128.0.0/28")
  msg = "Public subnet has wrong CIDR"
}

deny[msg] {
  not contains_availability_zone(input.planned_values[0].root_module[0].resources, "aws_subnet.public", "eu-central-1")
  msg = "PUblic subnet has wrong availability zone"
}


deny[msg] {
  not contains_owner_tag(input.planned_values[0].root_module[0].resources, "rosemary")
  msg = "Resources are missing owner tag"
}