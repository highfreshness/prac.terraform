resource "aws_instance" "my_instance" {
    ami = "ami-04ea5b2d3c8ceccf8"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_sg_web.id]
    key_name = aws_key_pair.my_sshkey.key_name

    tags = {
        Name = "webserver"
    }

    provisioner "local-exec" {
        command = <<-EOF
            echo "${self.public_ip} ansible_ssh_user=ec2-user ansible_ssh_private_key_file=/home/vagrant/.ssh/id_rsa" > inventory.ini    
        EOF 
    }
}

output "public_ip2" {
    value = aws_instance.my_instance2.public_ip
}

resource "aws_key_pair" "my_sshkey" {
    key_name = "my_sshkey"
    public_key = file("/home/vagrant/.ssh/id_rsa.pub")
}