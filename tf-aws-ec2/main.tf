
terraform {
  required_version = "~> 0.12"
}

provider "aws" {
  region  = var.region
  version = "~> 2.59"
}

provider "local" {
  version = "~> 1.4"
}

