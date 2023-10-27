resource "aws_vpc" "myvpc5" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "my_vpc"
    }

}

output "vpc" {
  description = "ID of object vpc"
  value       = "aws_vpc.myvpc5.id"
  sensitive = true

}

resource "aws_instance" "myec2" { 
    ami = "ami-024e6efaf93d85776"
    #count =2
    instance_type = "t2.micro"
    tags = {
      Name = "hands_demo"
    }

}

output "myec2" {
  value = "aws_instance.myec2.id"
  
}

resource "aws_subnet" "demo_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = "vpc-0c86f11702e55609a"
    tags = {
      Name = "mysubnet"
    }

}

output "subnet" {
  value = "aws_subnet.demo_subnet.id"
  
}

resource "aws_instance" "ec2_pro" {
  ami = var.ami_image
  instance_type = "t2.micro"
  #count = 2
  subnet_id = "subnet-03e98563de2b42efa"
  tags = {
    Name = var.instance_name
  }

}

resource "aws_instance" "test" {
  ami = var.ami_image
  instance_type = var.instance_name
  subnet_id = var.subnet
  
}