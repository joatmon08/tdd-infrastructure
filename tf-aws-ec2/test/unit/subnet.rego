package main

deny[msg] {
  not input.resource.aws_subnet.public
  msg = "Define public subnet resource"
}

deny[msg] {
  not input.resource.aws_subnet.private
  msg = "Define private subnet resource"
}

deny[msg] {
  not input.resource.aws_subnet.public.map_public_ip_on_launch
  msg = "Public Subnet CIDR Block is not public"
}

deny[msg] {
  not re_match(".*public", input.resource.aws_subnet.public.tags.Name)
  msg = "Public subnet missing tag `Name`"
}

deny[msg] {
  not contains(input.resource.aws_subnet.public.availability_zone, "data.aws_availability_zones.available")
  msg = "Use data resources to interpolate availability zone"
}


deny[msg] {
  input.resource.aws_subnet.private.map_public_ip_on_launch
  msg = "Private Subnet CIDR Block is not private"
}

deny[msg] {
  not re_match(".*private", input.resource.aws_subnet.private.tags.Name)
  msg = "Private subnet missing tag `Name`"
}

deny[msg] {
  not contains(input.resource.aws_subnet.public.availability_zone, "data.aws_availability_zones.available")
  msg = "Use data resources to interpolate availability zone"
}