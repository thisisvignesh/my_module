//vpc
resource "aws_vpc" "vpc" {

  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = var.vpc
  }
}
output "vpc_id" {
  value = ""
}
//public_subnet
resource "aws_subnet" "subnet_public" {

  vpc_id = aws_vpc.vpc.id

  cidr_block = var.pub_subnet_cidr
  //assigning public_ip
  map_public_ip_on_launch = var.map_public_ip_on_launch

  availability_zone = var.pub_subnet_zone

  tags = {
    Name = var.pub_subnet
  }
}
output "subnet_id" {
  value = ""
}

//private_subnet
resource "aws_subnet" "subnet_private" {

  vpc_id = aws_vpc.vpc.id

  cidr_block = var.pri_subnet_cidr
  //assigning public_ip
  map_public_ip_on_launch = var.map_public_ip_on_launch_private

  availability_zone = var.pri_subnet_zone

  tags = {
    Name = var.pri_subnet
  }
}

//IGW
resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.vpc.id

  tags = {

    Name = var.igw

  }
}
//RT

resource "aws_route_table" "rtb_public" {

  vpc_id = aws_vpc.vpc.id

  route {

    cidr_block = var.pub_rt_cidr
    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {

    Name = var.pub_rt
  }
}
//CREATE A FILE SUBNETASS.TF WHICH IS USED TO MAKE OUR SUBNET PUBLIC

resource "aws_route_table_association" "rta_subnet_public" {

  subnet_id = aws_subnet.subnet_public.id

  route_table_id = aws_route_table.rtb_public.id


}

//route_table for private subnet
resource "aws_route_table" "rtb_private" {

  vpc_id = aws_vpc.vpc.id

  route {

    cidr_block = var.pri_rt_cidr
    gateway_id = aws_nat_gateway.ngw.id

  }

  tags = {

    Name = var.pri_rt
  }
}
//CREATE A FILE SUBNETASS.TF WHICH IS USED TO MAKE OUR SUBNET PRIVATE

resource "aws_route_table_association" "rta_subnet_private" {

  subnet_id = aws_subnet.subnet_private.id

  route_table_id = aws_route_table.rtb_private.id
}
//nat-gateway to provide secure internet  for privat_subnet
resource "aws_nat_gateway" "ngw" {

  subnet_id     = aws_subnet.subnet_public.id
  allocation_id = aws_eip.nat_eip.id
  tags = {

    Name = var.ngw
  }
}
// creating elastic ip for nat gateway
resource "aws_eip" "nat_eip" {

  tags = {

    Name = var.nat_eip
  }

}

