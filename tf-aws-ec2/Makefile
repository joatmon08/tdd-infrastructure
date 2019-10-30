unit:
	conftest test -p test/unit/vpc.rego vpc.tf -i hcl2
	conftest test -p test/unit/subnet.rego subnet.tf -i hcl2
	conftest test -p test/unit/securitygroup.rego securitygroup.tf -i hcl2
	terraform validate

contract:
	#terraform plan -out .tfplan
	#terraform show -json .tfplan > .tfplan.json
	conftest test -p test/contract/base.rego .tfplan.json -i hcl