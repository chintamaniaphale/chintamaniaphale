
variable "name"{
    type =  string
}

variable "vpcid"{
     type=string
}

variable "secgrp"{
     type=string
}

variable "subnetid"{
     type=string
}

variable "cnt"{
     type=string
}


resource "aws_instance" "myec2"{
    count = var.cnt
    ami = "ami-0af25d0df86db00c1"
    instance_type = "t3.micro"
    subnet_id =  var.subnetid
    key_name = "MyEc2KeyPair"
    vpc_security_group_ids = [var.secgrp]
    tags = {
        Name = "${var.name}_${count.index}"
          }  
}