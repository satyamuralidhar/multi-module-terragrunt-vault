data "terraform_remote_state" "foo" {
  backend = "local"
    
  config = {
    path = "..//..//keystore//grunt//terraform.tfstate"
    #key = "env://..//..//keystore//grunt//*.tfstate"
  }
}

data "vault_aws_access_credentials" "creds" {
  backend = data.terraform_remote_state.foo.outputs.backend
  role    = data.terraform_remote_state.foo.outputs.role
}