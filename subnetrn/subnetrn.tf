variable "rangeip"{
    type = list(object({
        ingress = number
        protocol = string
    }))
}

variable "vpcsubid" {
    type = string
}

resource "aws_security_group" "allow_tls"{
vpc_id = var.vpcsubid
   dynamic  "ingress" {
        iterator =  port
        for_each =  var.rangeip
        content {
             from_port = port.value.ingress
             to_port =  port.value.ingress
             protocol = port.value.protocol
             cidr_blocks = ["172.31.16.1/32"]
        }
   }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  } 
 
}

output "securitygrp"{
    value = aws_security_group.allow_tls.id
}