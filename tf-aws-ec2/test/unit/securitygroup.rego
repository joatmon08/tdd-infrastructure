package main

deny[msg] {
  count(input[i]) < 3
  msg = "Security groups should be at least 3"
}

deny[msg] {
  not input["resource.aws_security_group.web"]
  msg = "Define web security group"
}

deny[msg] {
  not input["resource.aws_security_group.elb"]
  msg = "Define elb security group"
}

deny[msg] {
  not input["resource.aws_security_group.db"]
  msg = "Define db security group"
}

deny[msg] {
  not input["resource.aws_security_group.web"].ingress.from_port == 8099
  msg = "Web security group should allow ingress on app port 8099"
}

deny[msg] {
  not input["resource.aws_security_group.elb"].ingress.from_port == 80
  msg = "ELB security group should allow ingress on port 80"
}