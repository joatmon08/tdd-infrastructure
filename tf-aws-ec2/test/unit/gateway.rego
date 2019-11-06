package main

# deny[msg] {
#   not input["resource.aws_internet_gateway.app_vpc"]
#   msg = "Define internet gateway"
# }

# deny[msg] {
#   not input["resource.aws_route_table.public"]
#   msg = "Define public subnet route table"
# }

# deny[msg] {
#   not input["resource.aws_route_table_association.public"]
#   msg = "Define public subnet route table association"
# }