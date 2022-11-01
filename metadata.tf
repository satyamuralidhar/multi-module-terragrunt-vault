#note update the ami id and location on enviroment.yaml files on grunt and infra folders
#updated the server address on main.tf file based on ur vault server
update export cmds 
export TF_VAR_aws_access_key=
export TF_VAR_aws_secret_key=

stage:1
#creation of vault roles in vault server
login into vault server run cmds

#vault server -dev -dev-listen-address=0.0.0.0:8200 -dev-root-token-id="mysecrettoken" &
run below cmds on keystore/grunt folder
# terragrunt fmt 
# terragrunt plan
# terragrunt apply
# terragrunt destroy

#creation of resources in aws

run below cmds on ec2/infra folder
# terragrunt fmt                                                                                                                                         u
# terragrunt plan
# terragrunt apply
# terragrunt destroy

