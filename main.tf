# The organization's data
data "aws_organizations_organization" "org" {
  provider = aws.master
}

# ------------------------------------------------------------------------------
# Add launch permissions for all non-master accounts in the
# organization whose names match the account_name_regex, as well as
# any extra-organizational account IDs listed in
# var.extraorg-account_ids.
# ------------------------------------------------------------------------------

resource "aws_ami_launch_permission" "accounts" {
  for_each = toset(concat([
    for account in data.aws_organizations_organization.org.non_master_accounts :
    account.id
    if length(regexall(var.account_name_regex, account.name)) > 0
  ], var.extraorg_account_ids))

  image_id   = var.ami_id
  account_id = each.value
}
