resource "aws_instance" "app_server" {
  ami                         = var.ami_id
  count                       = var.ins_count
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_public.id
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address


  tags = {
    Name = var.ins_name
  }
}