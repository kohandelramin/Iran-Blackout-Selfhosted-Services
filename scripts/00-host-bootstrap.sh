#!/usr/bin/env bash
set -euo pipefail

if [ "${EUID}" -ne 0 ]; then
  echo "Run as root or with sudo."
  exit 1
fi

apt update
apt install -y ca-certificates curl gnupg lsb-release ufw nginx unzip git htop nano

if ! command -v docker >/dev/null 2>&1; then
  curl -fsSL https://get.docker.com | sh
fi

systemctl enable docker
systemctl start docker

echo "Host bootstrap finished. Log out and log in again if you added your normal user to docker group."
