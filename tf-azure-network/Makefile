TFPLAN = .tfplan

unit:
	conftest test -p test/unit/network.rego network.tf -i hcl

contract:
	terraform plan -out $(TFPLAN)
	terraform show -json $(TFPLAN) > $(TFPLAN).json
	rm -f $(TFPLAN)
	conftest test -p test/contract $(TFPLAN).json

terraform-cloud:
ifndef TF_CLOUD_TOKEN
	$(error TF_CLOUD_TOKEN is undefined)
endif
	echo 'credentials "app.terraform.io" {' > /root/.terraformrc
	@echo "  token = \"$(TF_CLOUD_TOKEN)\"" >> /root/.terraformrc
	echo "}" >> /root/.terraformrc