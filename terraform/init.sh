#!/bin/bash

terraform init ./s3 
terraform apply -var lambda_zip_file_name=main.zip -var lambda_zip_file_path=./s3 -auto-approve ./s3 
#terraform apply  -auto-approve ./s3
