data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name= "name"
        values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    }
}

resource "aws_instance" "my_instance" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    tags = local.common_tags
}

variable "instance_type" {
    default = "t2.micro"
}

locals {
    common_tags = {
        Name = "vm01"
    }
}

output "sg_name" {
    value = aws_instance.my_instance.security_groups
}