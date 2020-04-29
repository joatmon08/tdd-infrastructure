TFPLAN = .tfplan

install:
	bundle install

unit:
	conftest test -p test/unit/vpc.rego vpc.tf
	conftest test -p test/unit/securitygroup.rego securitygroup.tf
	conftest test -p test/unit/gateway.rego gateway.tf
	conftest test -p test/unit/subnet.rego subnet.tf
	terraform validate
	terraform fmt

contract:
	terraform plan -out $(TFPLAN) -var-file=terraform.tfvars
	terraform show -json $(TFPLAN) > $(TFPLAN).json
	conftest test -p test/contract/logic.rego $(TFPLAN).json
	conftest test -p test/contract/instances.rego $(TFPLAN).json

apply:
	terraform apply

integration: apply
	kitchen test

clean-kitchen:
	kitchen destroy default-ubuntu || true

clean: clean-kitchen
	terraform destroy --force  || true
	rm $(TFPLAN) $(TFPLAN).json || true