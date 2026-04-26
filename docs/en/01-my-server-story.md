# My server story

This repo is written like my own notes. I wanted a small set of services that could still help a group communicate when normal apps are blocked, slow, or unreliable.

The idea is not to replace the whole internet. The idea is to keep basic communication alive:

- A meeting room with Jitsi
- A voice room with TeamSpeak
- A chatroom with Mattermost
- A simple stream with Owncast
- A file sharing panel with FileBrowser

The hardest part was not always the services themselves. The hard part was the surrounding setup: Docker images not pulling, DNS not resolving, SSL and CDN redirects, UDP ports being forgotten, and people trying to connect from different ISPs.

## What worked best for me

- Keep everything Docker based.
- Keep one folder per service.
- Keep Nginx reverse proxy outside Docker when possible.
- Keep UFW rules explicit.
- Keep a `.ir` domain and subdomains ready.
- Keep mirror configs saved locally.
- Keep backups of `.env` files outside Git.
