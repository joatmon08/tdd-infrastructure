unit:
	go test ./tests/unit/...

contract:
	go test ./tests/contract/...

integration:
	cd tests/integration && bundle exec rake spec

plan:
	terraform plan -var-file=test.tfvars

apply:
	terraform apply -var-file=test.tfvars