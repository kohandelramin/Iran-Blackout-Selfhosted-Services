# Jitsi

I use Jitsi as a Google Meet alternative and sometimes for game streaming experiments with OBS virtual camera or screen share.

## Recommended setup

For Jitsi, I recommend using the official `docker-jitsi-meet` release instead of rewriting the whole compose file manually.

```bash
mkdir -p /opt/jitsi
cd /opt/jitsi
wget $(wget -q -O - https://api.github.com/repos/jitsi/docker-jitsi-meet/releases/latest | grep zip | cut -d '"' -f4)
unzip stable-*.zip
cd docker-jitsi-meet-*
cp env.example .env
./gen-passwords.sh
nano .env
```

Important `.env` values:

```text
PUBLIC_URL=https://meet.example.ir
TZ=Asia/Tehran
ENABLE_AUTH=0
ENABLE_GUESTS=1
ENABLE_LETSENCRYPT=0
HTTP_PORT=8000
HTTPS_PORT=8443
JVB_PORT=10000
```

Start it:

```bash
docker compose up -d
```

## Ports

- `8000/tcp` or your selected HTTP port behind Nginx
- `8443/tcp` only if you use internal HTTPS
- `10000/udp` very important for media

## Notes from my setup

- If meetings connect but video/audio quality is bad, check UDP 10000 first.
- If using ArvanCloud CDN, be careful with proxy mode. Web traffic can go through CDN, but UDP media traffic cannot be proxied like normal HTTP.
- For game streaming, screen share is usually better than OBS virtual camera when camera resolution is limited.
