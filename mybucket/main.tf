provider "aws" {
  version = "~> 2.0"
  region     = "${var.aws_region}"
}

data "aws_caller_identity" "current" {}