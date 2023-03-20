#!/usr/bin/env sh

if [ ! -f ./bin/vela ]; then
  mkdir -p bin tmp
  curl -OL "https://github.com/oam-dev/kubevela/releases/download/v1.7.6/vela-v1.7.6-darwin-arm64.tar.gz" &&
  tar -xvf vela-v1.7.6-darwin-arm64.tar.gz &&
  chmod +x darwin-arm64/vela &&
  mv darwin-arm64/vela bin/vela &&
  rm -rf darwin-arm64 vela-v1.7.6-darwin-arm64.tar.gz
else
  echo "Vela found at ./bin/vela"
fi
