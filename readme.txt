terraform init > To initiate terraform

terraform validate > To validate terraform configuration

terraform plan > View the configuration before apply(current state)
    terraform plan -out format (to save the current state)

terraform apply > To apply the configuration(desired state)
    terraform apply -auto-approve (auto approve)
    terraform apply -var "" (to pass variable)
    terraform apply -var-file (to pass .tfvar file)

terraform destroy > To destroy deployed terraform resources
    terraform destroy -target "" (avoid this, resource in config will not deleted. Best practice to make changes in config file)
    terraform destroy (removes all the resources)

terraform state (state of current configuration)
    terraform state list (current state up and running resources)

terraform state > current state

terraform backup > backup of configuration

terraform global variable > export TF_VAR.variablename="value"