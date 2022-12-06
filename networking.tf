resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 instance_tenancy = "labvpc"
 tags = {
   Name = "Project VPC"
 }
}

resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 cidr_block = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.availability_zones, count.index)
 
 tags = {
   Name = "Private Subnet ${count.index + 1}"
 }
}
