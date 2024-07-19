module "my_vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.vpc_name
    cidr = var.vpc_cidr

    azs = var.vpc_aza // 가용영역
    private_subnets = var.vpc_private_subnets
    public_subnets = var.vpc_public_subnets

    enable_nat_gateway = true
    enable_vpn_gateway = true


    tags = {
        Terraform = "true"
        Environment = "dev"
    }
}

resource "aws_instance" "my_instance" {
    ami                     = data.aws_ami.amazon_linux.id
    instance_type           = var.instance_type
    vpc_security_group_ids  = [aws_security_group.my_sg_web.id]
    key_name                = aws_key_pair.my_sshkey.key_name
    subnet_id               = module.my_vpc.public_subnets[0]
}

// local의 ssh 키를 이용해 key_pair 생성
resource "aws_key_pair" "my_sshkey" {
    key_name = "my_sshkey"
    public_key = file("~/.ssh/id_rsa.pub")
}