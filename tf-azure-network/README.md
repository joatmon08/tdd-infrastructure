# Example with Terraform / Azure / Networking

This example has a set of unit and contract tests for Azure
networking.

In particular, it demonstrates the use of contract tests
to check for-loops and variable information.

## Pre-Requisites
* [Terraform](https://www.terraform.io/downloads.html) (v0.12.24)
* [Terraform Cloud](app.terraform.io/signup) with __Governance Tier__
* [Sentinel](https://docs.hashicorp.com/sentinel/)
* [conftest](https://github.com/instrumenta/conftest)
* Microsoft Azure Account

## Testing
There are two types of tests:
* unit - run with `make unit`
* contract
  * conftest - set Azure credentials as environment variables and run `make contract`
  * Sentinel - set up the policy set in Terraform Cloud and run it against the workspace