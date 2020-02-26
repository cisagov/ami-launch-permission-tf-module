# This is the default provider- it must have permissions to assign
# launch permissions to the specified AMI
provider "aws" {
}

# This is the provider for the AWS Master account- it must have permissions
# to read AWS Organizations data
provider "aws" {
  alias = "master"
}
