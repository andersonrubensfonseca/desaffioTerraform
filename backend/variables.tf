variable "region" {
  description = "Região da AWS para o backend"
  type        = string
  default     = "us-east-1"
}

variable "backend_bucket" {
  description = "Nome do bucket S3 para armazenar o estado do Terraform"
  type        = string
  default     = "terraform-remote-state-bucket"
}

variable "backend_key" {
  description = "Caminho para o arquivo de estado no bucket S3"
  type        = string
  default     = "~/terraform.tfstate"
}

variable "backend_dynamodb_table" {
  description = "Nome da tabela DynamoDB para bloqueio de estado"
  type        = string
  default     = "terraform-remote-state-lock"
}
