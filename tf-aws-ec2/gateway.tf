// resource "aws_internet_gateway" "app_vpc" {
//   vpc_id = aws_vpc.app_vpc.id
//   tags = {
//     Name  = "${var.prefix}-gateway"
//     Owner = var.owner
//   }
// }

// resource "aws_route_table" "public" {
//   vpc_id = aws_vpc.app_vpc.id
//   route {
//     cidr_block = "0.0.0.0/0"
//     gateway_id = aws_internet_gateway.app_vpc.id
//   }
//   tags = {
//     Name  = "${var.prefix}-public-route"
//     Owner = var.owner
//   }
// }

// resource "aws_route_table_association" "public" {
//   subnet_id      = aws_subnet.public.id
//   route_table_id = aws_route_table.public.id
// }