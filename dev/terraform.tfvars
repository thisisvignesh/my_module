//VPC
vpc_cidr = "10.0.0.0/16"
vpc      = "prod"

//PUBLIC_SUBNET
pub_subnet              = "public_subnet"
pub_subnet_cidr         = "10.0.1.0/24"
pub_subnet_zone         = "ap-south-1a"
map_public_ip_on_launch = "true"

//PRIVATE_SUBNET
pri_subnet_cidr                 = "10.0.2.0/24"
pri_subnet_zone                 = "ap-south-1b"
map_public_ip_on_launch_private = "false"
pri_subnet                      = "private_subnet"

//IGW
igw = "igw"

//PUBLIC ROUTE TABLE
pub_rt      = "public_route_table"
pub_rt_cidr = "0.0.0.0/0"

//PRIVATE_ROUTE_TABLE
pri_rt      = "private_route_table"
pri_rt_cidr = "10.0.1.0/24"
ngw         = "ngw"
nat_eip     = "nat_eip"

//SECURITY_GROUE
sg_name         = "my_sg"
sg_from_port_no = 22
sg_to_port_no   = 22
sg_in_cidr      = ["0.0.0.0/0"]
sg_out_cidr     = ["0.0.0.0/0"]
sg_protocol     = "ssh"

//INSTANCE
ami_id        = "ami-0108d6a82a783b352"
ins_count     = "2"
instance_type = "t2.micro"

ins_name                    = "prod"
associate_public_ip_address = "true"
key_name                    = "mumbai acc2"
