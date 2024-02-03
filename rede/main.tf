provider "aws" {
  region = var.region
}

# Infraestrutura de Rede
resource "aws_vpc" "minha_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "MinhaVPC"
  }
}

resource "aws_subnet" "minha_subnet_publica" {
  vpc_id                  = aws_vpc.minha_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.zona_disponibilidade
  map_public_ip_on_launch = true

  tags = {
    Name = "MinhaSubnetPublica"
  }
}

resource "aws_internet_gateway" "meu_internet_gateway" {
  vpc_id = aws_vpc.minha_vpc.id
}

resource "aws_route_table" "minha_tabela_de_rotas" {
  vpc_id = aws_vpc.minha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.meu_internet_gateway.id
  }
}

resource "aws_route_table_association" "associacao_tabela_rotas" {
  subnet_id      = aws_subnet.minha_subnet_publica.id
  route_table_id = aws_route_table.minha_tabela_de_rotas.id
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow SSH inbound"
  vpc_id      = aws_vpc.minha_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MeuSubGrupo"
  }
}
