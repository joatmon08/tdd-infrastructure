package main

deny[msg] {
  not input.resource.aws_vpc.app_vpc
  msg = "Define VPC resource"
}

deny[msg] {
  not contains(input.resource.aws_vpc.app_vpc.cidr_block, "var.vpc_cidr")
  msg = "App VPC CIDR Block should have variable `var.vpc_cidr`"
}

deny[msg] {
  not input.resource.aws_vpc.app_vpc.tags.Name
  msg = "App VPC missing tag `Name`"
}