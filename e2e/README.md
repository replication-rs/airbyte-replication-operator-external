# E2E tests

Our automated test suite. Should match the official tests in the rigor. No compromise here at all.

## Prerequisites

We need a lot of infrastructure setup for E2E tests. <br/>
This will be slowly automated as we make progress (Looking at you Temporal).

### Minio Local?

```shell
brew install minio/stable/minio
mkdir -p ~/airbyte-replication-operator-data
export MINIO_ROOT_USER=minio
export MINIO_ROOT_PASSWORD=miniostorage
minio server --console-address :9090 ~/airbyte-replication-operator-data
http://localhost:9090

```

### Datasets

```shell
cargo run --bin nyc_taxi_data
```

### Kind

```shell
kind create cluster --image kindest/node:v1.24.7 --config infra/kind/cluster.yaml

```

### KubeVela

```shell
./infra/vela/setup.sh
./bin/vela install -y
./bin/vela addon enable velaux --version=v1.7.4
./bin/vela addon enable infra/vela/addons/minio
./bin/vela addon enable infra/vela/addons/airbyte-replication-operator

```

## File-to-CSV, simple things first

```shell

cd hello-airbyte-file-to-csv/docker
docker compose up
docker compose down && cd ..
kubectl apply -f k8s --recursive
vela up -f vela/application.yaml --namespace default
vela status hello-airbyte-file-to-csv --namespace default
vela logs hello-airbyte-file-to-csv --namespace default
vela delete hello-airbyte-file-to-csv --namespace default --force
kubectl delete -f k8s --recursive
```

## S3-to-S3, a good benchmarking exercise.

```shell
cd ../hello-airbyte-s3-to-s3/docker
docker compose up
docker compose down && cd ..
kubectl apply -f k8s --recursive
vela up -f vela/application.yaml --namespace default
vela status hello-airbyte-s3-to-s3 --namespace default
vela logs hello-airbyte-s3-to-s3 --namespace default
vela delete hello-airbyte-s3-to-s3 --namespace default --force
kubectl delete -f k8s --recursive

```

## Postgres-to-S3, started to getting interesting.

```shell
cd ../hello-airbyte-postgres-to-s3/docker
docker compose up
docker compose down && cd ..
kubectl apply -f k8s --recursive
vela up -f vela/application.yaml --namespace default
vela status hello-airbyte-postgres-to-s3 --namespace default
vela logs hello-airbyte-postgres-to-s3 --namespace default
vela delete hello-airbyte-postgres-to-s3 --namespace default --force
kubectl delete -f k8s --recursive

```

## Cleanup

```shell
kind delete cluster --name airbyte-replication-operator-platform
```


