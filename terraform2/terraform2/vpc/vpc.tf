provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-2"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"   # 65536 subnets
}

resource "aws_security_group" "my_sg" {
  name = "my-demo-sg"
  description = "my security group"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
resource "aws_instance" "new_instance_1" {
  ami = "ami-0911e88fb4687e06b"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_subnet.id
  key_name = "My-keys"
  #security_groups = [ aws_security_group.my_sg.name ]
}