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

* [Adding Launch Permissions to an AMI for All Accounts Named "env*"](https://github.com/cisagov/ami-launch-permission-tf-module/tree/develop/examples/account_names_starting_with_env)

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.0 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| account_name_regex | A regular expression that will be applied against the names of all accounts in the AWS organization.  If the name of an account matches the regular expression, that account will be allowed to launch the specified AMI. | string | | yes |
| ami_id | The ID of the AMI to assign launch permissions to. | string | | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| accounts | A map whose keys are the account names allowed to launch the AMI and whose values are the account IDs and the AMI ID. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
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
