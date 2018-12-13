#!/bin/bash
echo "install secret"
aws --endpoint-url=http://localhost:4584 secretsmanager create-secret --name dev/pgsql --secret-string file://pgsql.dev.secret.json
echo "retrieving secret"
aws --endpoint-url=http://localhost:4584 secretsmanager get-secret-value --secret-id dev/pgsql
