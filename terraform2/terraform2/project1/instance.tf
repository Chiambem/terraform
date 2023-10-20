module "my_ec2" {
    source = "../module-terra"
    ami = "ami-0cf0e376c672104d6"
    instance_type = "t2.micro"
    sg = "my-sg"
  
}