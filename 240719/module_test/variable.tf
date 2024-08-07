variable "instance_type" {
    description = "Instance type for VPC"
    type = string
    default = "t2.micro"
}

variable "vpc_name" {
    description = "Name of VPC"
    type = string
    default = "my_vpc"
}

variable "vpc_cidr" {
    description = "CIDR block for VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_aza" {
    description = "Availablity zones for VPC"
    type = list(string)
    default = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "vpc_private_subnets" {
    description = "Private subnets for VPC"
    type = list(string)
    default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_public_subnets" {
    description = "public subnets for VPC"
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

# variable "vpc_enable_nat_gateway" {
#     description = "Enable NAT gateway for VPC"
#     type = bool
#     default = "true"
# }