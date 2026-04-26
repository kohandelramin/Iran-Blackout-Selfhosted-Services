#!/usr/bin/env bash
set -euo pipefail

if [ "${EUID}" -ne 0 ]; then
  echo "Run as root or with sudo."
  exit 1
fi

ufw default deny incoming
ufw default allow outgoing
ufw allow OpenSSH
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 10000/udp
ufw allow 9987/udp
ufw allow 10011/tcp
ufw allow 30033/tcp
ufw allow 1935/tcp
ufw --force enable
ufw status verbose
