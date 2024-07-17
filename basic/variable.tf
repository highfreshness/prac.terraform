resource "aws_instance" "example" {
    ami = "ami-04ea5b2d3c8ceccf8"
    instance_type = "t2.micro"
    
    tags = local.common_tags
}

variable "project_name" {
    default = "my_project"
}

variable "environment" {
    default = "dev"
}

locals {
    common_tags = {
        Name = "${var.project_name}-${var.environment}" // my_proejct-dev
        project_name = var.project_name // my_project
        Environment = var.environment // dev
    }
}
