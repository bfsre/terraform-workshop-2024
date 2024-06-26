# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=3.5.0".
# Note the extra `/` after the protocol is required for the shorthand
# notation.
terraform {
    source = "${get_path_to_repo_root()}/ch04/modules/compute_engine"
}

include {
    path = find_in_parent_folders("terragrunt_common.hcl")
}

dependency "network" {
    config_path = "../network"
    mock_outputs = {
        network_name = "workshop-network"
        subnet_name = "workshop-subnet"
    }
}

locals {
    config_vars = yamldecode(file(find_in_parent_folders("config.yaml")))
    my_instance_name = "workshop-vm"
}

inputs = {
    project_id            = local.config_vars.project_id
    region                = local.config_vars.region
    instance_name         = local.my_instance_name
    network_name          = dependency.network.outputs.network_name
    subnet_name           = dependency.network.outputs.subnet_name
}