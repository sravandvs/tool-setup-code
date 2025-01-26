terraform {
  backend "s3" {
    bucket = "terraform-ds80"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}