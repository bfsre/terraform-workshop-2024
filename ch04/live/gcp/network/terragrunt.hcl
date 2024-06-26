# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=3.5.0".
# Note the extra `/` after the protocol is required for the shorthand
# notation.
terraform {
    source = "${get_path_to_repo_root()}/ch04/modules/network"
}

include {
    path = find_in_parent_folders("terragrunt_common.hcl")
}

locals {
    config_vars = yamldecode(file(find_in_parent_folders("config.yaml")))
}

inputs = {
    project_id            = local.config_vars.project_id
    region                = local.config_vars.region
    network_name          = "workshop-network"
    subnet_name           = "workshop-subnet"
    firewall_rule_name    = "workshop-ssh-rule"
    subnet_ip_cidr_range  = "10.0.1.0/24"
}