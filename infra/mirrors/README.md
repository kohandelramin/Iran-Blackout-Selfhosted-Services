# Mirrors for Iran network conditions

This is the part that usually saves time when internet access is broken or unstable.

## Docker registry mirrors

Example `/etc/docker/daemon.json`:

```json
{
  "registry-mirrors": [
    "https://docker.arvancloud.ir",
    "https://mirror-docker.runflare.com",
    "https://docker.iranserver.com",
    "https://docker-mirror.liara.ir"
  ]
}
```

Restart Docker:

```bash
sudo systemctl restart docker
```

## pip mirrors

```bash
pip config --user set global.index-url https://mirror-pypi.runflare.com/simple
pip config --user set global.trusted-host mirror-pypi.runflare.com
```

Alternative:

```bash
pip config set global.index-url https://mirror.iranserver.com/pypi/simple
pip config set global.trusted-host mirror.iranserver.com
pip config set global.timeout 60
```

## npm mirrors

```bash
npm config set registry https://mirror-npm.runflare.com
```

Alternative:

```bash
npm config set registry https://package-mirror.liara.ir/repository/npm/ --global
```

## apt mirrors

Use ArvanCloud Linux repository guide or another Iranian mirror that supports your Ubuntu version.

Backup first:

```bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
```

Then edit:

```bash
sudo nano /etc/apt/sources.list
sudo apt update
```

## My practical rule

Do not trust only one mirror. Keep 2 or 3 tested options in your notes. In Iran, a mirror can be good today and broken tomorrow.
