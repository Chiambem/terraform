resource "aws_security_group" "asg" {
    name_prefix = "${var.sg}-"  # when you call the module, you can put any name you want

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

      ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}
resource "aws_instance" "demo_ec2" {
        ami = var.ami
        instance_type = var.instance_typ
        security_groups = [aws_security_group.asg.name]

        tags = {
          Name = "my_ec2"
        }
}