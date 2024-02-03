terraform {
  backend "s3" {
    bucket         = var.backend_bucket
    key            = var.backend_key
    region         = var.region
    encrypt        = true
    dynamodb_table = var.backend_dynamodb_table
  }
}
