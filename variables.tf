# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "ami_id" {
  description = "The ID of the AMI to assign launch permissions to."
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "account_name_regex" {
  description = "A regular expression that will be applied against the names of all accounts in the AWS organization.  If the name of an account matches the regular expression, that account will be allowed to launch the specified AMI.  The default value should not match any valid account name."
  type        = string
  default     = "^$"
}

variable "extraorg_account_ids" {
  type        = list(string)
  description = "A list of AWS account IDs corresponding to \"extra\" accounts with which you want to share this AMI (e.g. [\"123456789012\"]).  Normally this variable is used to share an AMI with accounts that are not a member of the same AWS Organization as the account that owns the AMI."
  default     = []
}
