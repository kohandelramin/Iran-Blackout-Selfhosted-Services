#!/usr/bin/env bash
set -euo pipefail

if [ "${EUID}" -ne 0 ]; then
  echo "Run as root or with sudo."
  exit 1
fi

cat >/etc/sysctl.d/99-disable-ipv6.conf <<'SYSCTL'
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
SYSCTL

sysctl --system

echo "IPv6 disabled through sysctl. Reboot if some interfaces still show IPv6."
