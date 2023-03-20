# Minio

```shell
../../bin/kustomize build kustomize > controller.yaml
../../bin/kubectl slice -f controller.yaml --output-dir resources/
vela def init minio -t component --desc "Minio" --template-yaml controller.yaml > minio.cue
vela def vet minio.cue
vela def render minio.cue -o app.yaml
vela def apply minio.cue --namespace vela-system
```

## Secrets

```shell
echo 'YWRtaW4=' | base64 --decode
echo 'cGFzc3dvcmQ=' | base64 --decode
echo 'bWluaW9hZG1pbgo=' | base64 --decode

export AWS_ACCESS_KEY_ID=$(echo 'admin' | base64)
export AWS_SECRET_ACCESS_KEY=$(echo 'password' | base64)

~/minio server --console-address :9090 ~/data

./bin/vela addon enable ./setup/vela/addons/minio \
  user="admin" \
  password="password"

vela port-forward -n vela-system addon-minio 9000:9000 9090:9090
```