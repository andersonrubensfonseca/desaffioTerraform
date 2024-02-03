output "vpc_id" {
  value = aws_vpc.minha_vpc.id
}

output "subnet_id" {
  value = aws_subnet.minha_subnet_publica.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.meu_internet_gateway.id
}
