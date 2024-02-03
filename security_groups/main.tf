# Configurações do Security Group
resource "aws_security_group" "meu_security_group" {
  name        = "MeuSecurityGroup"
  description = "Permite tráfego SSH e HTTP de qualquer lugar"
  # Restante das configurações do Security Group
}

# Restante das configurações do Security Group...
