# This is the provider for the AWS Master account- it must have permissions
# to read AWS Organizations data
provider "aws" {
  alias = "master"
}
