resource "aws_security_group" "elb" {
  name        = "${var.prefix}-elb"
  description = "Security Group for ELB"
  vpc_id      = aws_vpc.app_vpc.id

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Owner = var.owner
  }
}

resource "aws_security_group" "web" {
  name        = "${var.prefix}-web"
  description = "Voter Web Security Group"
  vpc_id      = aws_vpc.app_vpc.id

  ingress {
    from_port   = 8099
    to_port     = 8099
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Owner = var.owner
  }
}

resource "aws_security_group" "db" {
  name        = "${var.prefix}-db"
  description = "Security group for database instances"
  vpc_id      = aws_vpc.app_vpc.id

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Owner = var.owner
  }
}