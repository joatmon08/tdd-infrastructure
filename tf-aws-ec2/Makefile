SETUP := aws-vault exec rosemary.training --
TFPLAN = .tfplan

unit:
	conftest test -p test/unit/vpc.rego vpc.tf -i hcl2
	conftest test -p test/unit/subnet.rego subnet.tf -i hcl2
	conftest test -p test/unit/securitygroup.rego securitygroup.tf -i hcl2
	terraform validate
	terraform fmt

contract:
	#$(SETUP) terraform plan -out $(TFPLAN)
	#terraform show -json $(TFPLAN) > $(TFPLAN).json
	conftest test -p test/contract/logic.rego $(TFPLAN).json -i hcl
	conftest test -p test/contract/instances.rego $(TFPLAN).json -i hcl

clean:
	rm $(TFPLAN) $(TFPLAN).json