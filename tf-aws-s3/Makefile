include local.env
export $(shell sed 's/=.*//' local.env)

install:
	bundle install
	dep ensure

unit:
	go test ./tests/unit/...

contract:
	go test ./tests/contract/...

integration:
	cd tests/integration && bundle exec rake spec

plan:
	terraform plan -var-file=test.tfvars -var 'pgp_key=${PGP_KEY}'

apply:
	terraform apply -var-file=test.tfvars -var 'pgp_key=${PGP_KEY}'

destroy:
	terraform destroy -var-file=test.tfvars -var 'pgp_key=${PGP_KEY}'

extract:
	terraform output bucket_read_user_access_id
	terraform output bucket_read_user_secret_key | base64 --decode | gpg -d
	terraform output bucket_write_user_access_id
	terraform output bucket_write_user_secret_key | base64 --decode | gpg -d
	terraform output bucket_admin_access_id
	terraform output bucket_admin_secret_key | base64 --decode | gpg -d