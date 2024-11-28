#access_key= "AKIATWBJZ43KFRC5JCB5"
#secret_key= "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"

provider "aws" {
  region = var.location  
#  access_key = "AKIATWBJZ43KFRC5JCB5"
#  secret_key = "TJ+TrSly3DUOwVSteTF1JLEqMyCpROBPkhQDyCk5"
}

resource "aws_instance" "ec2_example" {

   ami           = var.ami
   instance_type =  var.instance_type

   tags = {
           Name = var.tag
   }
} 