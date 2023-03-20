# Airbyte Replication Driver 

## Utils

```shell
yq --prettyPrint -o=json replication-output-sample.yaml
```

## Testing

https://nexte.st/index.html

https://github.com/kubernetes-sigs/kwok/

```shell
# Unit tests
cargo test
# Integration tests
cargo test -- --ignored
# All tests
cargo test -- --include-ignored

```

## Benchmarking

```shell
cargo install cargo-benchcmp
cargo install flamegraph
```

## Audits

```shell
cargo install cargo-audit
cargo audit

```

## Operating

### Local

```shell
airbyte-replication-driver --command state --replication hello-airbyte-file-to-csv --store-path tmp
```

### K8s

```shell
airbyte-replication-driver --command state --replication hello-airbyte-file-to-csv --store k8s 
```

## Monitoring

```shell
cargo install --locked tokio-console
```

## CLI

## Integrations


