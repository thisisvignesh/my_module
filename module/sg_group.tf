resource "aws_security_group" "sg" {

  name = var.sg_name

  vpc_id = aws_vpc.vpc.id

  ingress {

    from_port = var.sg_from_port_no

    to_port = var.sg_to_port_no

    protocol = "tcp"

    cidr_blocks = var.sg_in_cidr

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = var.sg_out_cidr

  }

  tags = {

    Name = var.sg_protocol

  }
}