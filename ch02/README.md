## Terraform Concept

#### Resource
```
resource "aws_instance" "resource_name" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}
```
* ```aws_instance``` is the resource type defined by the provider. Inside the ```{}``` are the configuration arguments for the resource.
(Not like Imperative Language, because HCL is a Declaritive Language.)
--
* ```resource_name``` is the special resource name defined by ourselves.
--
* ```Resource```其實就是Terraform的最基本單元，所有的Infra都是以Resource為基礎創建。



#### provider
* A provider is a plugin for Terraform that offers a collection of resource types. 
--
* Each resource type is implemented by a provider. A provider provides resources to manage a single cloud or on-premises infrastructure platform. 
--
* Providers are distributed separately from Terraform, but Terraform can automatically install most providers when initializing a working directory.
--
* Every Terraform provider has its own documentation, describing its resource types and their arguments.
--
* ```Provider``` 基本上就是各大Infra服務提供商，專門介接自己的API，開放給Terraform使用。
--
* 注意：Provider 未必會提供所有你需要的服務，若有些甚至是閹割版，必須確認你使用的Provider有完整提供。

```
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "{{YOUR GCP PROJECT}}"
  region  = "us-central1"
  zone    = "us-central1-c"
}
```
* The name given in the block header (```"google"``` in this example) is the **local** name of the provider to configure. This provider should already be included in a required_providers block.

---
```
# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`.
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

```
* To declare a configuration alias within a module in order to receive an alternate provider configuration from the parent module, add the configuration_aliases argument to that provider's required_providers entry.
--

```
resource "aws_instance" "foo" {
  provider = aws.west

  # ...
}
```
* By default, resources use a default provider configuration (one without an alias argument) inferred from the first word of the resource type name.

* To use an alternate provider configuration for a resource or data source, set its provider meta-argument to a ```<PROVIDER NAME>.<ALIAS>``` reference:

> [Terraform-Registry](https://registry.terraform.io/)

---

#### Module
> A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more .tf files is a module. 

Modules Tree : 
```
modules
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
└── version.tf
```

* Terraform commands will only directly use the configuration files in one directory, which is usually the current working directory. However, your configuration can use module blocks to call modules in other directories. When Terraform encounters a module block, it loads and processes that module's configuration files.

* 

##### 1. Variable
[ref.](https://developer.hashicorp.com/terraform/language/values/variables)
```
Input variables let you customize aspects of Terraform modules without altering the module's own source code. This functionality allows you to share modules across different Terraform configurations, making your module composable and reusable.

When you declare variables in the root module of your configuration, you can set their values using CLI options and environment variables. When you declare them in child modules, the calling module should pass values in the module block.

If you're familiar with traditional programming languages, it can be useful to compare Terraform modules to function definitions:

- Input variables are like function arguments.
- Output values are like function return values.
- Local values are like a function's temporary local variables.
```

* Local 可以做函式變換，但vars不行