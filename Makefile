GIT_ROOT=$(git rev-parse --show-toplevel)

lint:
	terraform fmt -check

test: 
	@echo "Running integration tests"
	cd $GIT_ROOT/test/docker && docker-compose up -d
	cd test/terraform && terraform init
	cd test/terraform && terraform validate
	cd test/terraform && terraform apply -auto-approve -var-file="variables.tfvars" 
	cd test/terraform && terraform destroy -auto-approve -var-file="variables.tfvars"
	cd test/docker && docker-compose down
	cd test/terraform && rm .terraform && rm .terraform.lock.hcl && .terraform.tfstate && .terraform.tfstate.backup