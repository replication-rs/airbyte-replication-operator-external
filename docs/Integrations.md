# Integrations

## Orchestration

### KubeVela

KubeVela is a Modern Application Platform built on top of Kubernetes.

It is a CNCF Incubator level [project](https://kubevela.io/blog/2023/03/06/incubation).

Airbyte Replication operator can be run using KubeVela as an Addon.

A YouTube video demo
is [here](https://ekalavya.dev/how-to-use-kubevela-for-airbyte-replications).

To run locally, setup KubeVela on your local Kubernetes cluster.
Refer [Official documentation](https://kubevela.io/docs/installation/standalone) for installation steps.

`Note:` We need cluster level access, so recommended way of running this demo is on a local cluster.
Example [Kind](../e2e/k8s/kind/README.md) configuration.

Also enable VelaUX, the web UX for KubeVela. E2E tests has a [reference](../e2e/README.md)

Once Vela is running on the cluster.

```shell
cd e2e
vela addon enable infra/vela/minio
vela addon enable infra/vela/airbyte-replication-operator

```

Setup up some test data. Here we will
try [Airbyte Connector Source S3](https://docs.airbyte.com/integrations/sources/s3)
to [Airbyte Connector Destination S3](https://docs.airbyte.com/integrations/destinations/s3) replication.

```shell
# TODO: upload test datasets to minio. But for now Minio's drag and drop is super nice.
```

S3-to-S3 to replication

```shell
kubectl apply -f hello-airbyte-s3-to-s3/k8s --recursive
vela up -f hello-airbyte-s3-to-s3/vela/application.yaml

```

Check the Replication application running in the VelaUX, default username/password: `admin/VelaUX12345`.

```shell
vela port-forward -n vela-system addon-velaux 9082:80

```

Cleanup

```shell
vela uninstall

```

### Temporal

We can also use [Temporal](https://temporal.io/) like
the [Official Airbyte](https://docs.airbyte.com/understanding-airbyte/high-level-view) for scheduling.

If you already run Temporal, then Airbyte is an excellent implementation. Check
out [documentation here](https://docs.airbyte.com/).

Here is a simple workflow code [example](../examples/scheduler.rs) for any custom scheduling needs based on our tiny
replication driver.

A video demo
is [here](https://ekalavya.dev/how-to-use-temporal-for-scheduling-airbyte-replication-driver).

## Execution

### Podman

A video demo
is [here](https://ekalavya.dev/how-to-run-airbyte-replication-driver-using-podman).

### Youki

A video demo
is [here](https://ekalavya.dev/how-to-run-airbyte-replication-driver-using-youki).

### Amazon ECS

A video demo
is [here](https://ekalavya.dev/how-to-run-airbyte-replication-driver-using-amazon-ecs).

### Amazon Fargate

A video demo
is [here](https://ekalavya.dev/how-to-run-airbyte-replication-driver-using-aws-fargate).

### Firecracker VM

A video demo
is [here](https://ekalavya.dev/how-to-run-airbyte-replication-driver-using-firecracker-vm).
