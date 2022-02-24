all: banner lint test

banner:
	@echo "Making Module Cloudflare-Caddy-Ingress"

lint:
	@terraform fmt -check

test: banner
	@echo "Running integration tests"
	@cd test/docker && docker-compose up -d
	@cd test/terraform && terraform init
	@cd test/terraform && terraform validate
	@cd test/terraform && terraform apply -auto-approve -var-file="variables.tfvars" 
	@cd test/terraform && terraform destroy -auto-approve -var-file="variables.tfvars"
	@cd test/docker && docker-compose down
	@cd test/terraform && rm -rf .terraform && rm .terraform.lock.hcl && rm terraform.tfstate && rm terraform.tfstate.backup

docs:
