# Airbyte Replication Operator

An implementation of [**Airbyte Protocol**](https://github.com/airbytehq/airbyte-protocol)
in [Rust](https://www.rust-lang.org/) aiming to be simple, modular, extensible and resource efficient.

:star::star::star:`Unstable and Work in progress`:star::star::star:

Please try at your own risk. Feedback is much appreciated.

This is solely a personal project of [Harsha Teja Kanna](https://www.linkedin.com/in/h7kanna/) and not affiliated
with [Airbyte
Inc.](https://airbyte.com/) which owns [Airbyte](https://github.com/airbytehq).

`Note:` This is **NOT** a Kubernetes Operator for [Airbyte](https://github.com/airbytehq/airbyte-platform), only an
independent implementation of the Airbyte Protocol.

## Introduction

This is the partial mirror repository for an implementation of Airbyte
Protocol [data plane](https://airbyte.com/blog/what-you-missed-at-move-data).

Why? Check the architecture reasoning here [ADR](./adrs/0001-why.md)

Why Rust? Check the decision record here [ADR](./adrs/0002-rust.md)

Introduction blog: https://ekalavya.dev/why-and-how-i-implemented-airbyte-protocol-in-rust

Upcoming blog series [here](#blogsdemos)

`Note:` It will become the canonical repository once the implementation is ready(currently, in a rough state) for public
review and contributions.

## Roadmap

- [x] Standalone data
  replication [`Driver`](https://github.com/airbytehq/airbyte-platform/tree/main/airbyte-container-orchestrator) from
  Airbyte [`Source`](https://docs.airbyte.com/understanding-airbyte/airbyte-protocol-docker#source)
  to [`Destination`](https://docs.airbyte.com/understanding-airbyte/airbyte-protocol-docker#destination)
- [ ] Pluggable `State` management layer
- [ ] Pluggable progress `Tracking` and `Monitoring`
- [ ] Pluggable OCI Container/VM integration (containerd, Docker, Podman, [Youki](https://github.com/containers/youki),
  Firecracker VM, ECS etc. )
- [ ] Multiple execution models (parallel/serial)
- [ ] Feature parity with official [Airbyte Platform](https://github.com/airbytehq/airbyte-platform) (
  only [data plane](https://airbyte.com/blog/what-you-missed-at-move-data) components )
  - [ ] Mappers
  - [ ] Validators
  - [ ] Normalization/dbt? (Currently not in scope)
  - [ ] Operators/Transformers? (Currently not in scope)
- [ ] Rust CDK (Connector Development Kit) :rocket:
- [ ] Kubernetes Operator
- [ ] CLI
- [ ] Airbyte Desktop, Yes! :rocket:
- [ ] Benchmarks
- [ ] Usage Examples
- [ ] [KubeVela](https://kubevela.io/) integration
- [ ] 100% Airbyte Protocol compatability and acceptance tests
- [ ] Automated tests
- [ ] CI
- [ ] Deployment and operations documentation
- [ ] Stable (GA) releases
- [ ] Setup SLSA3 Provenance for release artifacts.
- [ ] FAQs
- [ ] Strictly keep the driver binary to minimal size (ideally under 10MB). Very important :smiley:

## Documentation

- Start here for [Quick Start](./docs/Quickstart.md) on your machine.
- Start here for [Replication Driver](./docs/Driver.md)
- Start here for [Kubernetes Operator](./docs/Operator.md)
- Start here for [CLI](./docs/CLI.md) operations
- Documentation for existing and possible [Integration](./docs/Integrations.md) ideas.
- Frequently asked questions ([FAQs](./docs/FAQ.md))

## Upcoming Blogs/Demos

- https://h7kanna.medium.com/why-and-how-i-integrated-airbyte-and-apache-hudi-c18aff3af21a
- https://ekalavya.dev/why-and-how-i-implemented-airbyte-protocol-in-rust
- https://ekalavya.dev/let-us-copy-some-bytes-using-airbyte-replication-driver-in-rust
- https://ekalavya.dev/architecture-deep-dive-airbyte-replication-driver-in-rust
- https://ekalavya.dev/overview-of-airbyte-replication-operator-in-rust-use-cases
- https://ekalavya.dev/introduction-to-airbyte-replication-driver-in-rust-cli-operations
- https://ekalavya.dev/how-to-run-airbyte-replication-operator-kubevela-addon
- https://ekalavya.dev/overview-of-parallel-executions-in-airbyte-replication-driver
- https://ekalavya.dev/how-to-use-temporal-for-scheduling-airbyte-replication-driver
- https://ekalavya.dev/how-to-run-airbyte-replication-driver-using-podman
- https://ekalavya.dev/how-to-run-airbyte-replication-driver-using-youki
- https://ekalavya.dev/running-airbyte-replication-driver-on-amazon-ecs
- https://ekalavya.dev/running-airbyte-replication-driver-on-aws-fargate
- https://ekalavya.dev/firecracker-vm-for-airbyte-replications
- https://ekalavya.dev/how-i-integrated-airbyte-and-apache-hudi-again

## High level Architecture view

![Airbyte Replication Operator](./docs/assets/airbyte_replication_operator.png)

## Low level Architecture view

![Airbyte Replication Driver](./docs/assets/airbyte_replication_driver.png)



