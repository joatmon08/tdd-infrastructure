resource "local_file" "kitchen" {
  content  = templatefile("templates/kitchen.tpl", { mongodb_host_ip = aws_instance.db.private_ip, region = var.region, availability_zone = data.aws_availability_zones.available.names[0], public_subnet_id = aws_subnet.public.id, ami_id = data.aws_ami.ubuntu.id })
  filename = "kitchen.yml"
}