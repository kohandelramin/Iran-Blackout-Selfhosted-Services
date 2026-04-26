# Iran Blackout Self Hosted Services

A practical repo based on my own experience running Docker based communication services on a Linux server in Iran, especially when international internet access becomes unstable or partially unavailable.
فارسی: [README.fa.md](README.fa.md)
## Why I made this
When access to global services gets unreliable, the first things that break for small teams are usually communication, file sharing, meetings, voice chat, and streaming. I wanted one place where I can keep my working setup, not as a perfect production platform, but as a practical survival stack.
This repo is written from the perspective of someone who actually had to run these services, fix DNS problems, deal with Docker image pull issues, use local mirrors, and keep things simple enough to restore quickly.
## Services included
| Service | What I use it for | Alternative to |
| --- | --- | --- |
| Jitsi | Browser based meetings and game streaming experiments | Google Meet |
| TeamSpeak 3 | Low latency voice rooms | Discord voice |
| Mattermost | Private chatroom for a small group | Telegram, Slack, Discord text |
| Owncast | Personal live streaming service | Twitch, YouTube Live |
| FileBrowser | File sharing through my own server | Paid file sharing websites |
## Basic server assumptions
My normal setup is:
- Ubuntu 24.04 server
- Docker and Docker Compose
- Nginx reverse proxy on host
- ArvanCloud DNS and CDN where it makes sense
- UFW firewall
- Cheap `.ir` domain from IRNIC or a reseller
- No secrets in Git
For public sharing, never commit real passwords, real private keys, real admin tokens, or your real server IP if you do not want it public.
## Repo structure
```text
.
├── services/
│   ├── jitsi/
│   ├── teamspeak/
│   ├── mattermost/
│   ├── owncast/
│   └── filebrowser/
├── infra/
│   ├── docker/
│   ├── mirrors/
│   ├── dns/
│   ├── nginx/
│   ├── ufw/
│   └── windows/
├── scripts/
├── docs/
│   ├── en/
│   └── fa/
└── README.fa.md
```
## Fast start
```bash
git clone https://github.com/YOUR_USERNAME/iran-blackout-selfhosted-services.git
cd iran-blackout-selfhosted-services
cp .env.example .env
nano .env
Prepare the Linux server:
sudo bash scripts/00-host-bootstrap.sh
sudo bash scripts/01-disable-ipv6.sh
sudo bash scripts/02-ufw-basic.sh
Start one service:
cd services/filebrowser
docker compose up -d
## Suggested domain layout
Use one root domain and subdomains:
meet.example.ir       Jitsi
voice.example.ir      TeamSpeak 3
chat.example.ir       Mattermost
stream.example.ir     Owncast
files.example.ir      FileBrowser
In ArvanCloud DNS, create `A` records pointing each subdomain to your server IPv4.
## Important blackout notes
- Keep Docker images pulled before things get worse.
- Keep a local backup of compose files and `.env` files.
- Use Iranian mirrors for Docker, apt, pip, and npm when international access is broken.
- Test DNS providers before relying on one.
- Disable IPv6 if your server or Docker network starts creating strange connectivity problems.
- For Jitsi, UDP 10000 matters a lot. Without it, calls may connect but quality can be terrible.
- For TeamSpeak 3, open UDP 9987.
- For Owncast, test with OBS before you actually need it.
## Official project links
- Jitsi Docker: https://github.com/jitsi/docker-jitsi-meet
- TeamSpeak Docker image: https://hub.docker.com/_/teamspeak
- TeamSpeak 3 server Docker image: https://hub.docker.com/_/teamspeak
- Mattermost Docker: https://github.com/mattermost/docker
- Owncast: https://owncast.online
- FileBrowser: https://filebrowser.org
## Useful Iranian resources
- ArvanCloud Linux repositories: https://www.arvancloud.ir/fa/dev/linux-repository
- Iranian mirror list: https://0xv.ir/dev/
- Mirror guide article: https://virgool.io/@amirreza.sedighi/راهنمای-جامع-استفاده-از-میرورها-برای-توسعه-دهندگان-ایرانی-sw2tzkj1ua4l
- IRNIC: https://www.nic.ir
## Windows note
You can run Docker based services on Windows with Docker Desktop and WSL2, but I do not recommend Windows as the main public server for this stack. For a domain to work from the internet, you still need one of these:
1. A VPS with a public static IP.
2. A home or office internet line with public static IP and router port forwarding.
3. Dynamic DNS if your IP changes, but it is less stable.
For Iran blackout situations, a Linux VPS inside Iran is usually much easier to keep reachable than a Windows PC behind home NAT.
## Security warning
This repo is for practical self hosting, not a guarantee of privacy or anonymity. Your ISP, hosting provider, DNS provider, CDN provider, and server logs may still expose metadata. Do not use this setup for anything that puts people at risk.
