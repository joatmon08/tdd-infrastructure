data "aws_ami" "db" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-mongodb*"]
  }

  owners = ["979382823631"]
}

resource "aws_instance" "db" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.db.id
  vpc_security_group_ids = [aws_security_group.db.id]
  subnet_id              = aws_subnet.private.id
  tags = {
    Name  = "${var.prefix}-db"
    Owner = var.owner
  }
}
