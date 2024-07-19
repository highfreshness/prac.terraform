terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">= 5.30"
        }
    }
}

provider "aws" {
    profile = "default"
    region  = "ap-northeast-2"
}