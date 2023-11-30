# ami-launch-permission-tf-module #

[![GitHub Build Status](https://github.com/cisagov/ami-launch-permission-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/ami-launch-permission-tf-module/actions)

A Terraform module for giving one or more (non-master) accounts in an AWS
organization permission to launch an AMI.

## Usage ##

```hcl
module "example" {
  source = "github.com/cisagov/ami-launch-permission-tf-module"

  providers = {
    aws        = aws
    aws.master = aws.master
  }

  account_name_regex = "^env"
  ami_id             = "ami-0123456789abcdef0"
}
```

For reference, Terraform's regular expression syntax is documented
[here](https://www.terraform.io/docs/configuration/functions/regex.html).

## Examples ##

- [Adding Launch Permissions to an AMI for All Accounts Named "env*"](https://github.com/cisagov/ami-launch-permission-tf-module/tree/develop/examples/account_names_starting_with_env)

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 4.9 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 4.9 |
| aws.master | ~> 4.9 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_ami_launch_permission.accounts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami_launch_permission) | resource |
| [aws_organizations_organization.org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_name\_regex | A regular expression that will be applied against the names of all accounts in the AWS organization.  If the name of an account matches the regular expression, that account will be allowed to launch the specified AMI.  The default value should not match any valid account name. | `string` | `"^$"` | no |
| ami\_id | The ID of the AMI to assign launch permissions to. | `string` | n/a | yes |
| extraorg\_account\_ids | A list of AWS account IDs corresponding to "extra" accounts with which you want to share this AMI (e.g. ["123456789012"]).  Normally this variable is used to share an AMI with accounts that are not a member of the same AWS Organization as the account that owns the AMI. | `list(string)` | `[]` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| accounts | A map whose keys are the IDs of the AWS accounts allowed to launch the AMI, and whose values are the aws\_ami\_launch\_permission resources for the corresponding launch permissions. |
<!-- END_TF_DOCS -->

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
