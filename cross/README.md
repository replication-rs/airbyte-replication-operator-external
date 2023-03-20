# Cross builds

```shell
docker build -t aarch64 -f Dockerfile.aarch64-unknown-linux-gnu .
docker build -t aarch64 -f Dockerfile.x86_64-unknown-linux-gnu .
docker run -v $(pwd):/app:z -e RUSTFLAGS='-C target-feature=+crt-static' cross-aarch64:latest cargo build --release --target aarch64-unknown-linux-gnu
docker run -v $(pwd):/app:z cross-aarch64:latest cargo build --release --target aarch64-unknown-linux-gnu
docker run -v $(pwd):/app:z cross-aarch64:latest cargo build --release --target aarch64-unknown-linux-gnu
RUSTFLAGS='-C target-feature=+crt-static' cargo zigbuild --release --target aarch64-unknown-linux-gnu
```
