provider "aws" {
  region = "us-east-1"
}
module "rede" {
  source = "./rede"
}

module "instancias_ec2" {
  source = "./instancias_ec2"
}

module "security_groups" {
  source = "./security_groups"
}

module "chave_ssh" {
  source = "./chave_ssh"
}
