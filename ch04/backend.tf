terraform {
  backend "local" {
    path = "${get_path_to_repo_root()}/terraform.tfstate"
  }
}