dependencies {
  paths = ["..//..//keystore//grunt"]
}
dependency "keystore" {
  config_path = "..//..//keystore//grunt"
    //mock_outputs = {
  skip_outputs = true
}

terraform {
    source = "..//instance"
}


generate "provider" {
  path = "..//instance//providers.tf"
  if_exists = "skip"
  contents = <<EOF
  provider "aws" {
    profile = "default"
    name = "var.name"
  }
EOF
}
// inputs = {
//   ami_id = local.env_vars.locals.ami_id
//   location = local.env_vars.locals.location
//   tags = {
//     Name = "infra"
//   }
// }


// locals {
//   env_vars = yamldecode(
//   file("${"infra-environment.yaml"}")
//   )
// }