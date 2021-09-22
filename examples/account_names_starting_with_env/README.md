# Add Launch Permissions to an AMI for All Accounts Named "env*" #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Terraform will prompt you for an AMI ID to assign the launch permissions to.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 3.38 |

## Providers ##

No providers.

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| example | ../../ | n/a |

## Resources ##

No resources.

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_id | The ID of the AMI to assign launch permissions to. | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| accounts | A map whose keys are the account names allowed to launch the AMI and whose values are the account IDs and the AMI ID. |
