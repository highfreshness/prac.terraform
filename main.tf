resource "aws_instance" "instance01" {
    ami = "ami-04ea5b2d3c8ceccf8"
    instance_type = "t2.micro"

    tags = {
       Name = var.vm_name
    }
}

variable "vm_name" {
  default = "default_name"
}

/*
resource "aws_instance" "instance02" {
    ami = "ami-04ea5b2d3c8ceccf8"
    instance_type = "t2.micro"

    tags = {
        Name = "Myinstance02"
    }

    depends_on = [ aws_instance.instance01 ]
}
*/