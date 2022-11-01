provider "vault" {
  address = "http://30.11.157.54:8200"
  token = "mysecrettoken"
}
resource "vault_aws_secret_backend" "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  path       = "${var.name}"

  default_lease_ttl_seconds = "500"
  max_lease_ttl_seconds     = "600"
}

resource "vault_aws_secret_backend_role" "admin" {
  backend         = vault_aws_secret_backend.aws.path
  name            = "role"
  credential_type = "iam_user"

  policy_document = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:*", "ec2:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

output "backend" {
  value = vault_aws_secret_backend.aws.path
}

output "role" {
  value = vault_aws_secret_backend_role.admin.name
}
