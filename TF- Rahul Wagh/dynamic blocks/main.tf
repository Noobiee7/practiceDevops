provider "aws" {
  region = var.location
#  access_key = "AKIAXYKJUQ3EHB5BQHGS"
# secret_key = "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"
}

locals {
  ingress_rules =[
    {
        description = "ingress rule for port 443"
        port = 443
    },
    {
        port = 80
        description = "ingress rule for port 80"
    }
  ]
}

resource "aws_instance" "tfexample" {
  ami = var.ami
  instance_type = var.instance_type

  tags = {
    name = var.tag
  }
}


resource "aws_security_group" "main" {
    name = "resource_with_dynamic_block"
    #vpc_id = data.aws_vpc.main.id
    
  /*  egress = {
        cidr_blocks = ["0.0.0./0"]
        description = ""
    }
    */
    dynamic "ingress" {
      for_each = local.ingress_rules
      
      content {
        description = ingress.value.description
        from_port = ingress.value.port
        to_port = ingress.value.port
        protocol = "tcp"
      }
    }

    tags = {
      Name = "AWS security group dynamic block"
    }
}

