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

 /*variable "IAM_users" {
  description = "I am users list"
  type = list(string)
  default = ["user1","user2","user3"]
}
variable "my_set" {
  type = set(string)
  default = ["user1","user2","user3"]
}

locals {
  mylist = tolist(var.my_set)
}

resource "aws_iam_user" "example" {
  count = length(local.mylist)
  name = local.mylist[count.index]
}

output "users_list" {
  value = "created users"
}*/

#For loop examples
variable "IAM_users" {
  type = map(string)
  default     = {
    user1   = "normal user"
    user2   = "admin user"
    user3   = "root user"
  }
}

output "users_with_roles" {
   value = [for name, role in var.IAM_users : "${name} is the ${role}"]
}

/*locals {
  my_list = toset(var.IAM_users)
}

resource "aws_iam_user" "example" {
  for_each = local.my_list
  name=each.value
}*/