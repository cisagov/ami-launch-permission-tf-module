# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "account_name_regex" {
  description = "A regular expression that will be applied against the names of all accounts in the AWS organization.  If the name of an account matches the regular expression, that account will be allowed to launch the specified AMI."
}

variable "ami_id" {
  description = "The ID of the AMI to assign launch permissions to."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
