# Default AWS provider (EC2AMICreate role in the Images account)
provider "aws" {
  default_tags {
    tags = {
      Testing = true
    }
  }
  profile = "cool-images-ec2amicreate"
  region  = "us-east-1"
}

# AWS provider for the Master account (OrganizationsReadOnly role)
provider "aws" {
  alias = "master"
  default_tags {
    tags = {
      Testing = true
    }
  }
  profile = "cool-master-organizationsreadonly"
  region  = "us-east-1"
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
