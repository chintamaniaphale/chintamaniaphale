provider "aws"{

region = "ap-south-1"

}

resource "aws_vpc" "vpc"{

cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"   
  }
}

resource "aws_subnet" "pub"{
 vpc_id = aws_vpc.vpc.id
 cidr_block = "10.0.1.0/24"
 availability_zone = "ap-south-1a"

    tags = {
    Name = "mysub"   
  }

}

resource "aws_route_table_association" "rtasso"{
    subnet_id = aws_subnet.pub.id
    route_table_id = aws_vpc.vpc.default_route_table_id
}



module "ec2"{
 source = "./ec2"
 cnt = "3"
 vpcid = aws_vpc.vpc.id
 name  = "newEc2spawn"
 secgrp =  module.subnetrn.securitygrp
 subnetid = aws_subnet.pub.id
 #defrt = aws_vpc.vpc.default_route_table_id
 depends_on = [module.subnetrn.securitygrp]
 
}

module "subnetrn"{
    source = "./subnetrn"
    rangeip = [{"ingress":"22","protocol":"tcp"},{"ingress":"23","protocol":"tcp"}]
    vpcsubid = aws_vpc.vpc.id
}

output "vpcid" {
    value  = aws_vpc.vpc.id
}



