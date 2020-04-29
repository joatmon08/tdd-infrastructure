package main

deny[msg] {
  count(input.resource.aws_security_group) < 3
  msg = "Security groups should be at least 3"
}

deny[msg] {
  not input.resource.aws_security_group.web
  msg = "Define web security group"
}

deny[msg] {
  not input.resource.aws_security_group.db
  msg = "Define db security group"
}

deny[msg] {
  not input.resource.aws_security_group.elb
  msg = "Define elb security group"
}

deny[msg] {
  not input.resource.aws_security_group.web.ingress.to_port == 8099
  msg = "Web security group should allow ingress on app port 8099"
}

deny[msg] {
  not input.resource.aws_security_group.elb.ingress.to_port == 80
  msg = "ELB security group should allow ingress on port 80"
}

deny[msg] {
  not input.resource.aws_security_group.db.ingress.to_port == 27017
  msg = "Database security group should allow ingress on port 27017"
}