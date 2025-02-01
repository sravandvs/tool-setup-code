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
  "foo": "bar",
  "pizza": "cheese"
}
EOT
}