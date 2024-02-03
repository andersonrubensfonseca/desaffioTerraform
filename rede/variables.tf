variable "region" {
  description = "Região da AWS"
  type        = string
  default    = "us-east-1"
}

variable "zona_disponibilidade" {
  description = "Zona de Disponibilidade da Subnet Pública"
  type        = string
  default    = "us-east-1a"
}
