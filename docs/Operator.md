# Airbyte Replication Operator

## Requirements

- A Kubernetes cluster / k3d instance
- OpenTelemetry collector (**optional**)

## Cluster

As an example; get `k3d` then:

```sh
k3d cluster create --registry-create --servers 1 --agents 1 main
k3d kubeconfig get --all > ~/.kube/k3d
export KUBECONFIG="$HOME/.kube/k3d"
```

A default `k3d` setup is fastest for local dev due to its local registry.

## CRD

Apply the CRD from [cached file](../crd/crd.yaml), or pipe it from `crdgen` (best if changing it):

```sh
cargo run --bin crdgen > crd/crd.yaml
cargo run --bin crdgen | kubectl apply -f -
cargo run --bin crdgen | kubectl delete -f -

yq --prettyPrint -o=json < resources/customresourcedefinition-connections.airbyte.pravaah.dev.yaml

cue import -f -o clusterrole.cue -p main clusterrole.yaml
```

## Build

```shell
export DOCKER_BUILDKIT=1
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 --push -t h7kanna/airbyte-replication-operator:0.0.1 .
docker buildx build --platform linux/arm64 --push -t h7kanna/airbyte-replication-operator:0.0.1 .
docker buildx build --platform linux/amd64 --push -t h7kanna/airbyte-replication-operator:0.0.1 .
docker buildx build --platform linux/arm64 -t h7kanna/airbyte-replication-operator:0.0.1 --load --metadata-file metadata.json .
docker buildx build --platform linux/arm64 -t h7kanna/airbyte-replication-operator:0.0.1 --load .
docker buildx build --platform linux/amd64 -t h7kanna/airbyte-replication-operator:0.0.1 --load --metadata-file metadata.json .
docker buildx build --platform linux/amd64 -t h7kanna/airbyte-replication-operator:0.0.1 .

export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_RUSTFLAGS='-C target-feature=+crt-static'
cross build --target x86_64-unknown-linux-musl --release

export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_RUSTFLAGS='-C target-feature=+crt-static'
cross build --target aarch64-unknown-linux-musl --release

```

## Running

### Local

```sh
cargo run
```

## In-cluster

```sh
kubectl apply -f yaml/crd.yaml
kubectl wait --for=condition=available deploy/airbyte-replication-operator --timeout=20s
kubectl port-forward service/airbyte-replication-operator 8080:80
```

## Testing

```shell
cargo install cargo-tarpaulin
cargo binstall cargo-tarpaulin
cargo install cargo-nextest --locked

```
