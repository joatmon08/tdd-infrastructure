TFPLAN = .tfplan

unit:
	conftest test -p conftest/unit/network.rego network.tf -i hcl

contract:
	terraform plan -out $(TFPLAN)
	terraform show -json $(TFPLAN) > $(TFPLAN).json
	rm -f $(TFPLAN)
	conftest test -p conftest/contract $(TFPLAN).json