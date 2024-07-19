packer {
    required_plugins {
        amazon = {
            version = ">= 0.0.1"
            source = "github.com/hashicorp/amazon"
        }
    }
}

source "amazon-ebs" "ubuntu" {
    ami_name
    instance_type
    region
    source_ami_file
    ssh_username
}

build {
    name 
    sources
    provisioner "shell"
}