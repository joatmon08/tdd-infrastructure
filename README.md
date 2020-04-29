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

- [Introduction to Test-Driven Development](https://hackernoon.com/introduction-to-test-driven-development-tdd-61a13bc92d92)

### Server Testing Tools
- [Goss](https://github.com/aelsabbahy/goss)
- [Inspec](https://www.inspec.io/)
- [Test-Kitchen](https://docs.chef.io/kitchen.html)
  - [kitchen-ec2](https://github.com/test-kitchen/kitchen-ec2)

### Terraform Specific

- Thanks to @petems for discovering these...
  - [xchapter7x/clarity](https://github.com/xchapter7x/clarity)
  - [eerkunt/terraform-compliance](https://github.com/eerkunt/terraform-compliance)
  - [elmundio87/terraform-validate](https://github.com/elmundio87/terraform_validate)
- [gruntwork-io/terratest](https://github.com/gruntwork-io/terratest)
- [newcontext-oss/kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform)
- [instrumenta/conftest](https://github.com/instrumenta/conftest)
- [Open Policy Agent](https://www.openpolicyagent.org/docs/latest/terraform/)
- [Terraform Sentinel](https://www.terraform.io/docs/cloud/sentinel/index.html) (NOT OSS)

### Infrastructure Mocking

Use with caution. Mocks aren't always updated with latest API or configuration.

- [localstack](https://github.com/localstack/localstack) for AWS

### Kubernetes

- [vmware-tanzu/sonobuoy](https://github.com/vmware-tanzu/sonobuoy)
- [Open Policy Agent](https://www.openpolicyagent.org/docs/latest/kubernetes-tutorial/)
- [Helm unittest](https://github.com/lrills/helm-unittest)
- [Helm test](https://helm.sh/docs/helm/#helm-test)