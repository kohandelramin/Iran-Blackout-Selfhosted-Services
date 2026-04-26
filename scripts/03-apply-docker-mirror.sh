#!/usr/bin/env bash
set -euo pipefail

if [ "${EUID}" -ne 0 ]; then
  echo "Run as root or with sudo."
  exit 1
fi

mkdir -p /etc/docker
cp ../infra/docker/daemon.json /etc/docker/daemon.json
systemctl restart docker

docker info | grep -A 10 "Registry Mirrors" || true
