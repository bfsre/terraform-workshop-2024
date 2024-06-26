# Terragrunt Concept

## How to install Terragrunt ?

Before installing Terragrunt, please ensure that `terraform` has been installed.

### Windows

You can install Terragrunt on Windows using Chocolatey
```
choco install terragrunt
```

### macOS 
You can install Terragrunt on macOS using Homebrew
```
brew install terragrunt
```

### Linux

Most Linux users can use Homebrew
```
brew install terragrunt. 
```

Arch Linux users can use `pacman` to install it community-terragrunt. 
```
pacman -S terragrunt
```

Gentoo users can use `emerge` on Guru
```
emerge -a app-admin/terragrunt-bin
``` 

Another Linux [see for other systems](https://repology.org/project/terragrunt/versions).

### FreeBSD
You can install Terragrunt on FreeBSD using Pkg
``` 
pkg install terragrunt
```

## Terragrunt demo folder structure

```
.
├── README.md
├── backend.tf
├── live
│   └── gcp
│       ├── compute_engine
│       │   └── terragrunt.hcl
│       ├── config.yaml
│       └── network
│           └── terragrunt.hcl
├── modules
│   ├── compute_engine
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── version.tf
│   └── network
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
│       └── version.tf
└── terragrunt_common.hcl
```

## How to use?

if you only want to create network , please follow up steps

```
$ cd live/gcp/network
$ terragrunt init
$ terragrunt plan
$ terragrunt apply
```

if you try to create compute engine , please follow up steps

```
$ cd live/gcp/compute_engine
$ terragrunt run-all init
$ terragrunt run-all plan
$ terragrunt run-all apply
```

## After the practice is over, clear all resources

```
$ cd ../
$ terragrunt run-all destroy
```