terraform {
  backend "s3" {
    bucket = "terraform-ds80"
    key    = "vault-secrets/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "vault" {
  address = "http://vault-internal.devopsdvs.online:8200"
  token   = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}

resource "vault_mount" "roboshop-dev" {
  path      = "roboshop-dev"
  type      = "kv"
  options   = { version = "2" }
  description = "Roboshop Dev Secrets"
}

resource "vault_generic_secret" "roboshop-dev" {
  path = "${vault_mount.roboshop-dev.path}/frontend"

  data_json = <<EOT
{
  "catalogue_url": "http://catalogue-dev.devopsdvs.online:8080/",
  "cart_url": "http://cart-dev.devopsdvs.online:8080/",
  "user_url": "http://user-dev.devopsdvs.online:8080/",
  "shipping_url": "http://shipping-dev.devopsdvs.online:8080/"
  "payment_url": "http://payment-dev.devopsdvs.online:8080/",

}
EOT
}