provider "aws" {
    profile = "default"
    region = "eu-west-2"
}

resource "aws_instance" "UGO_Server" {
    ami = "ami-0cbf43fd299e3a464"
    instance_type = "t2.micro"
    
    tags = {
       Name = "MyNCAAInstance"
  }
}
