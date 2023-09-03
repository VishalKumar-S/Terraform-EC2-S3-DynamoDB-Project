# Terraform_project
This is a basic terraform project to create ec2 instance though terraform and use s3 bucket as backend server and lock the state file by integrating with the Dynamo DB.
1. Install and verify terrafrom in linux: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2. Clone the repository and go to the directory 
3. Terraform commands:
# Initialisation of terraform repository
terraform init
# Dry-run
terraform plan
# apply the change
terraform apply
4. Run main.tf of local folder to create ec2 instance, use the above commands in order.
5. Run main.tf of remote folder to create S3 bucket, dynamo db use the above commands in order.
6. Now, after successful completion of creating all the resources, configure the local main.tf to save the state file in the backend server by pasting the below command in the terraform block of local main.tf file
```hcl
terraform {
backend "s3" {
bucket = "THE_NAME_OF_THE_STATE_BUCKET"
key = "some_environment/terraform.tfstate"
region = "us-east-1"
encrypt = true
kms_key_id = "THE_ID_OF_THE_KMS_KEY"
dynamodb_table = "THE_ID_OF_THE_DYNAMODB_TABLE"
}
}
```
7. Use 'terraform output' command to see the bucket and dynamo db info from the output.tf file
