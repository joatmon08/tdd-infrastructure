resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.default.id}"
  count             = "${var.app_instances}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 3, count.index)}"
  availability_zone = "${element(split(",", lookup(var.azs, var.region)), count.index)}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.app_name}-public-${element(split(",", lookup(var.azs, var.region)), count.index)}-subnet"
    Owner = "${var.owner}"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.default.id}"
  count             = "${var.app_instances}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 3, count.index)}"
  availability_zone = "${element(split(",", lookup(var.azs, var.region)), count.index)}"
  map_public_ip_on_launch = false

  tags {
    Name = "${var.app_name}-public-${element(split(",", lookup(var.azs, var.region)), count.index)}-subnet"
    Owner = "${var.owner}"
  }
}