resource "aws_vpc" "app_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name  = var.prefix
    Owner = var.owner
  }
}

