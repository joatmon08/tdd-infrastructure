data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "local_file" "kitchen" {
  content  = templatefile("templates/kitchen.tpl", { db_host_ip = aws_instance.db.private_ip, region = var.region, availability_zone = data.aws_availability_zones.available.names[0], public_subnet_id = aws_subnet.public.id, ami_id = data.aws_ami.ubuntu.id })
  filename = ".kitchen.yml"
}

resource "local_file" "db_test" {
  content  = templatefile("templates/db_test.tpl", { db_host_ip = aws_instance.db.private_ip })
  filename = "test/integration/default/controls/db_test.rb"
}