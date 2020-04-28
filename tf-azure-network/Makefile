TFPLAN = .tfplan

unit:
	conftest test -p test/unit/network.rego network.tf -i hcl

contract:
	terraform plan -out $(TFPLAN)
	terraform show -json $(TFPLAN) > $(TFPLAN).json
	rm -f $(TFPLAN)
	conftest test -p test/contract $(TFPLAN).json