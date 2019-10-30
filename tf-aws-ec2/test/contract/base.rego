package main

containsVariables(variables) {
  variables[_].vpc_cidr[0].value = "10.128.0.0/25"
  variables[_].region[0].value = "eu-central-1"
  variables[_].owner[0]
}

containsCIDR(resources, resource, cidr) {
  resources[i].address = resource
  resources[i].values[0].cidr_block = cidr
}

containsAvailabilityZone(resources, resource, region) {
  resources[i].address = resource
  contains(resources[i].values[0].availability_zone, region)
}

containsOwnerTag(resources, owner) {
  tags := resources[i].values[0].tags[0]
  tags.Owner == owner
}

deny[msg] {
  not containsVariables(input.variables)
  msg = "Variables are not populated with expected values"
}

deny[msg] {
  not containsCIDR(input.planned_values[0].root_module[0].resources, "aws_subnet.private", "10.128.0.16/28")
  msg = "Private subnet has wrong CIDR"
}

deny[msg] {
  not containsAvailabilityZone(input.planned_values[0].root_module[0].resources, "aws_subnet.private", "eu-central-1")
  msg = "Private subnet has wrong availability zone"
}

deny[msg] {
  not containsCIDR(input.planned_values[0].root_module[0].resources, "aws_subnet.public", "10.128.0.0/28")
  msg = "Public subnet has wrong CIDR"
}

deny[msg] {
  not containsAvailabilityZone(input.planned_values[0].root_module[0].resources, "aws_subnet.public", "eu-central-1")
  msg = "PUblic subnet has wrong availability zone"
}


deny[msg] {
  not containsOwnerTag(input.planned_values[0].root_module[0].resources, "rosemary")
  msg = "Resources are missing owner tag"
}