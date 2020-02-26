# Default AWS provider (EC2AMICreate role in the Images account)
provider "aws" {
  region  = "us-east-1"
  profile = "cool-images-ec2amicreate"
}

# AWS provider for the Master account (OrganizationsReadOnly role)
provider "aws" {
  region  = "us-east-1"
  profile = "cool-master-organizationsreadonly"
  alias   = "master"
}

#-------------------------------------------------------------------------------
# Configure the example module.
#-------------------------------------------------------------------------------
module "example" {
  source = "../../"

  providers = {
    aws        = aws
    aws.master = aws.master
  }

  account_name_regex = "^env"
  ami_id             = var.ami_id
}
