package main

deny[msg] {
  not input["resource.aws_subnet.public"]
  msg = "Define public subnet resource"
}

deny[msg] {
  not input["resource.aws_subnet.private"]
  msg = "Define private subnet resource"
}

deny[msg] {
  not input["resource.aws_subnet.public"].map_public_ip_on_launch
  msg = "Public Subnet CIDR Block is not public"
}

deny[msg] {
  input["resource.aws_subnet.private"].map_public_ip_on_launch
  msg = "Private Subnet CIDR Block is not private"
}