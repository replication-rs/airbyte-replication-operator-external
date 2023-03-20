# K3d

If we need Custom K3d setup different from the one provided by [Vela](https://kubevela.io/docs/installation/standalone)

```shell
k3d cluster create --api-port 192.168.86.123:6443 --image rancher/k3s:v1.24.3-k3s1-arm64 airbyte-replication-operator-platform
k3d cluster create --image rancher/k3s:v1.24.3-k3s1-arm64 airbyte-replication-operator-platform
vela install -y
vela addon enable velaux --version=v1.7.4 domain=localhost
```
