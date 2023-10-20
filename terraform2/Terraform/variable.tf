variable "instance_name" {
description = "value of the Name tag name of ec2"
type = string
default = "New_ec2"
  
}

variable "ami_image" {
    type = string
    default = "ami-024e6efaf93d85776"
  
}

variable "ec2_instance" {
    type = string
    default = "t2.micro"

}

variable "subnet" {
    type = string
    default = "subnet-03e98563de2b42efa"
  
}