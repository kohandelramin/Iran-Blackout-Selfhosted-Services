# Checklist before blackout

Do this before you actually need the services.

## Server

- Docker installed
- Docker Compose working
- Nginx installed
- UFW enabled
- SSH key login tested
- Password login disabled if possible
- Backups tested

## Images

Pull the images while internet is still usable:

```bash
docker pull filebrowser/filebrowser:latest
docker pull owncast/owncast:latest
docker pull teamspeak:latest
docker pull mattermost/mattermost-team-edition:latest
docker pull postgres:16-alpine
```

For Jitsi, download the official release ZIP and keep a copy.

## DNS

- Domain renewed
- Nameservers set
- A records created
- Proxy mode tested
- Direct DNS mode tested for UDP based services

## Users

- Mattermost users created
- TeamSpeak 3 admin privilege key saved
- FileBrowser admin password changed
- Owncast stream key changed
- Jitsi URL tested with at least two people
