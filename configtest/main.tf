resource "aws_instance" "my_instance2"{
    ami = "ami-04ea5b2d3c8ceccf8"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_sg_web.id]

    user_data = file("./web_deploy.sh")

    tags = {
        Name = "webserver"
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("/home/vagrant/.ssh/id_rsa")
        host = self.public_ip
    }

    provisioner "file" {
        source = "web_deploy.sh"
        destination = "/tmp/web_deploy.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/web_deploy.sh",
            "/tmp/web_deploy.sh"
        ]
    }
    
    key_name = aws_key_pair.my_sshkey.key_name // 키페어 만들기
}

resource "aws_key_pair" "my_sshkey" {
    key_name = "my_sshkey"
    public_key = file("/home/vagrant/.ssh/id_rsa.pub")
}

output "public_ip2" {
    value = aws_instance.my_instance2.public_ip
}