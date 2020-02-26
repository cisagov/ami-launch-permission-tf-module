# Add Launch Permissions to an AMI for All Accounts Named "env*" #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Terraform will prompt you for an AMI ID to assign the launch permissions to.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| ami_id | The ID of the AMI to assign launch permissions to. | string | | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| accounts | A map whose keys are the account names allowed to launch the AMI and whose values are the account IDs and the AMI ID. |
