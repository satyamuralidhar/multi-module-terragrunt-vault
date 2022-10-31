
terraform {
    source = "..//vault"

}

locals {
  # Load the data from common.hcl
  env_vars = yamldecode(
  file("${"vault-environment.yaml"}")
  )
}



# Set the remote_state config dynamically to the remote_state config in common.hcl

// remote_state {
//   backend = "local"
//   config = {
//     path = "${path_relative_to_include()}/output/terraform.tfstate"
//   }
// }

generate "provider" {
  path = "..//vault//provider.tf"
  if_exists = "skip"
  contents = <<EOF
  provider "aws" {
    access_key = "var.aws_access_key"
    secret_key = "var.aws_secret_key"
    profile = "default"
    name = "var.name"
  }
EOF
}
// generate "backend" {
//   path = "backend.tf"
//   if_exists = "overwrite_terragrunt"
//   contents = <<EOF
// terraform {
//   backend "local" {
//     path = "terraform.tfstate"
//   }
// }
// EOF
// }



inputs = {
  address = local.env_vars.locals.address
  token = local.env_vars.locals.token
  tags = {
    Name = "infra"
  }
}

