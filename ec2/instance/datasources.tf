data "terraform_remote_state" "foo" {
  backend = "local"
    
  config = {
    path = var.path
  }
}

variable "path" { default = "/root/multi-module-terragrunt-vault/keystore/grunt/terraform.tfstate" }

data "vault_aws_access_credentials" "creds" {
  backend = data.terraform_remote_state.foo.outputs.backend
  role    = data.terraform_remote_state.foo.outputs.role
}
