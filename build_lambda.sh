#!/bin/bash

LAMBDADIR="/opt/code/localstack/go/src/gitlab.easy-network.it/Payfolder/loan"

if [ ! -d "$LAMBDADIR" ]; then
    echo @newest http://dl-cdn.alpinelinux.org/alpine/v3.9/community >> /etc/apk/repositories
    apk add zip go@newest git bash gcc musl-dev openssl

    mkdir -p /opt/code/localstack/go/src/gitlab.easy-network.it/Payfolder/loan go/bin

    export GOPATH=/opt/code/localstack/go
    export PATH=${GOPATH}/bin:$PATH
    export GOBIN=/opt/code/localstack/go/bin
    export PATH=$PATH:/opt/code/localstack/go/bin
    echo "Cloning gitlab.easy-network.it/Payfolder/loan.git..."
    git clone https://gitlab+deploy-token-1:2MMYxEmQBmm_VhVAyiuh@gitlab.easy-network.it/Payfolder/loan.git /opt/code/localstack/go/src/gitlab.easy-network.it/Payfolder/loan/

    echo "Dep install..."
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

    cd $GOPATH/src/gitlab.easy-network.it/Payfolder/loan
    echo "Install dependencies..."
    dep ensure
    echo "Building..."
    go build -v -a -ldflags "-linkmode external -extldflags -static" -o main
    echo "Zipping..."
    zip main.zip main assets/*
    echo "Install terraform..."
    wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
    unzip terraform_0.11.13_linux_amd64.zip
    mv terraform /usr/local/bin/
fi