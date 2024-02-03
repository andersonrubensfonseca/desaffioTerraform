provider "aws" {
  region = var.region
}

# Chave SSH
resource "aws_key_pair" "minha_chave_ssh" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}
