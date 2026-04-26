#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="${1:-$HOME/selfhosted-backups}"
DATE_TAG="$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/selfhosted-services-$DATE_TAG.tar.gz" \
  --exclude='*/postgres/base' \
  --exclude='*/mattermost/data' \
  services .env.example README.md README.fa.md infra scripts docs

echo "Backup created: $BACKUP_DIR/selfhosted-services-$DATE_TAG.tar.gz"
