resource "aws_instance" "server" {
  count = 4

  ami = "ami-04ea5b2d3c8ceccf8"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}