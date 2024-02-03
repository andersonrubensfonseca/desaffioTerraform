
provider "aws" {
  region = var.region
}

module "rede" {
  source = "./../rede"
  
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Ubuntu / Canonical owner ID
}

# Instâncias EC2
resource "aws_instance" "minha_instancia" {
  count         = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = module.rede.minha_subnet_publica.id
  vpc_security_group_ids = module.rede.allow_web.id

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y openjdk-17-jdk apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              EOF

  tags = {
    Name = "MinhaInstancia-${count.index + 1}"
  }
}

# Outputs para fornecer informações úteis
output "instance_ids" {
  value = aws_instance.minha_instancia[*].id
}

output "public_dns" {
  value = aws_instance.minha_instancia[*].public_dns
}
