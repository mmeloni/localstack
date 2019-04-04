#!/bin/bash

cd /opt/code/localstack/go/src/gitlab.easy-network.it/Payfolder/loan
cp main.zip /opt/code/localstack/tmp/
cp payond-dev.tf /opt/code/localstack/tmp/

echo "Terraform deploy..."
cd /opt/code/localstack/tmp
terraform init
terraform apply -auto-approve