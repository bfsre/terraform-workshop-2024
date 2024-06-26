remote_state {
  backend = "local"
  config = {
    path = "${get_parent_terragrunt_dir()}/terraform.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}