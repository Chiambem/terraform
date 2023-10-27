resource "aws_instance" "Demo" {
    ami = "ami-0ccabb5f82d4c9af5"
    instance_type = "t2.micro"

    tags = {
      Name = "dev envi"
    }
}	