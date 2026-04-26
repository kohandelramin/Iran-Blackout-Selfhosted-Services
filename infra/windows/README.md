# Windows hosting notes

You can run Docker based services on Windows using Docker Desktop with WSL2, but for public hosting I prefer Linux.

## What Windows can do

- Run FileBrowser, Owncast, Mattermost, and some other containers locally.
- Test services before moving them to a VPS.
- Host inside a LAN.

## What Windows cannot solve by itself

A domain needs a reachable public IP. If your Windows PC is behind a home router, people outside cannot reach it unless:

1. Your ISP gives you a public static IP.
2. Your router forwards the needed ports to your PC.
3. Windows Firewall allows those ports.
4. Your PC stays always on.

## Domain options

- Static IP: Add an `A` record from your domain to your IP.
- Dynamic IP: Use DDNS, but expect more breakage.
- No public IP: Use a VPS instead.

## My recommendation

Use Windows only for testing. For real blackout use, use a Linux VPS inside Iran with Docker Compose.
