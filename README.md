# tdd-infrastructure

Examples for Test-Driven Development (TDD) of infrastructure.

Each directory has its own README and Makefile documenting
how to run the tests and build the infrastructure associated
with the example.

- `tf-aws-ec2`: A TDD example created for [2019 O'Reilly Velocity](https://www.hashicorp.com/resources/test-driven-development-tdd-for-infrastructure)
- `tf-aws-s3`: A TDD example created for [this blog post](https://medium.com/@joatmon08/test-driven-development-techniques-for-infrastructure-a73bd1ab273b)
- `tf-azure-network`: A TDD example create for the [Perth Hashicorp User Group](https://www.youtube.com/watch?v=s0y0nRIrgwE)

Refer to the `Makefile` in each directory for how to build the tests.

## Useful References

### Test-Driven Development

Generally, you can write your own testing framework with any language, focusing on testing
the state or definition of infrastructure. For unit or contract (state) testing,
tests will involve checking JSON or YAML configuration. Most infrastructure as
code frameworks will already have acceptance tests to ensure the infrastructure
resources are created properly.

* [Introduction to Test-Driven Development](https://hackernoon.com/introduction-to-test-driven-development-tdd-61a13bc92d92)

### Server Testing Tools
* [Goss](https://github.com/aelsabbahy/goss)
* [Inspec](https://www.inspec.io/)
* [Test-Kitchen](https://docs.chef.io/kitchen.html)
  * [kitchen-ec2](https://github.com/test-kitchen/kitchen-ec2)

### Terraform Specific

#### Unit / Contract Testing

Below are frameworks that check for configuration that might lead to upstream problems
(not caught by Terraform plan). For example, database username must be 16 characters.

* [terraform-linters/tflint](https://github.com/terraform-linters/tflint)

The tools below are mostly presented as policy as code frameworks but can be used
for unit or contract (state) testing infrastructure.

* [instrumenta/conftest](https://github.com/instrumenta/conftest)
* [Open Policy Agent](https://www.openpolicyagent.org/docs/latest/terraform/)
* [Terraform Sentinel](https://www.terraform.io/docs/cloud/sentinel/index.html)
  (not OSS)

#### BDD Frameworks

Thanks to @petems for discovering these!

* [xchapter7x/clarity](https://github.com/xchapter7x/clarity)
* [eerkunt/terraform-compliance](https://github.com/eerkunt/terraform-compliance)
* [elmundio87/terraform-validate](https://github.com/elmundio87/terraform_validate)

#### End-to-End Frameworks

These are frameworks that create the infrastructure, execute a set of tests, and
(optionally) destroys the infrastructure.

* [gruntwork-io/terratest](https://github.com/gruntwork-io/terratest)
* [newcontext-oss/kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform)

#### Policy as Code (with Security Scanning)

Some of these frameworks include built-in policies for various providers, others must be
extended.

##### Built-In Policies

* [liamg/tfsec](https://github.com/liamg/tfsec)
* [accurics/terrascan](https://github.com/accurics/terrascan)
* [bridgecrew/checkov](https://github.com/bridgecrewio/checkov)
* [Terraform Sentinel](https://www.terraform.io/docs/cloud/sentinel/index.html)
  (not OSS)
* [fugue/regula](https://github.com/fugue/regula): policies you can run via Open
  Policy Agent
* [Forseti Terraform-Validator](https://github.com/GoogleCloudPlatform/terraform-validator)
  (not OSS)

##### Write Your Own

* [instrumenta/conftest](https://github.com/instrumenta/conftest)
* [Open Policy Agent](https://www.openpolicyagent.org/docs/latest/terraform/)
* [Terraform Sentinel](https://www.terraform.io/docs/cloud/sentinel/index.html)
  (not OSS)

### Infrastructure Mocking

Use with caution. Mocks aren't always updated with latest API or configuration.

* [localstack](https://github.com/localstack/localstack) for AWS
* [GCP Emulator](https://cloud.google.com/sdk/gcloud/reference/beta/emulators):
  emulates specific services on GCP. Mostly for application-related use.

### Kubernetes

* [vmware-tanzu/sonobuoy](https://github.com/vmware-tanzu/sonobuoy)
* [Open Policy Agent](https://www.openpolicyagent.org/docs/latest/kubernetes-tutorial/)
* [Helm unittest](https://github.com/lrills/helm-unittest)
* [Helm test](https://helm.sh/docs/helm/#helm-test)