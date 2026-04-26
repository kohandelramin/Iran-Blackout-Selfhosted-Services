# Docker setup

## Install Docker on Ubuntu

```bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
```

Log out and log in again, then test:

```bash
docker version
docker compose version
```

## Docker mirror config

Copy the example config:

```bash
sudo mkdir -p /etc/docker
sudo cp infra/docker/daemon.json /etc/docker/daemon.json
sudo systemctl restart docker
```

If one mirror is down, comment it out or keep only one mirror and restart Docker again.

## Pre-pull images

```bash
docker pull filebrowser/filebrowser:latest
docker pull owncast/owncast:latest
docker pull teamspeak:latest
docker pull mattermost/mattermost-team-edition:latest
docker pull postgres:16-alpine
```
