terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "local" {
    path = "..//..//..//..//terraform.tfstate"
  }
}