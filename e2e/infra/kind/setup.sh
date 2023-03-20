#!/usr/bin/env sh

## Get IP address from environment
envsubst <cluster.template.yaml >cluster.yaml
kind create cluster --image kindest/node:v1.24.7 --config cluster.yaml

## We need to add Api Server SAN to run the operator from the local so that `Rustls` has no problems to connect to the cluster. ##
sed -i '' "s/192.168.86.123/kubernetes.vela.internal/g" ~/.kube/config
