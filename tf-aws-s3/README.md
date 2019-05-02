# Example with Terraform / AWS / S3

This example has a set of tests to create a secured
S3 bucket in AWS.

## Pre-Requisites
* [Terraform](https://www.terraform.io/downloads.html) (v0.11.13)
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (v2.6.3) & Bundler
* [Golang](https://golang.org/doc/install) (v1.12.4) & [dep](https://github.com/golang/dep)
* AWS account with IAM & S3 access
* Run `make install` to install dependencies.

## Testing
There are three types of tests:
* unit - run with `make unit`
* contract - set AWS credentials in your shell and run `make contract`
* integration - set AWS credentials in your shell and run `make integration`

## Deploying Infrastructure
1. Set AWS credentials.
1. Create a PGP public key and save it.
    1. Make sure you base64 encode it.
    1. Set that in a `local.env` file, like below:
       ```
       PGP_KEY=<base64 encoded key>
       ```
1. Run `make plan` to dry run.
1. Run `make apply` to create the S3 bucket and users.