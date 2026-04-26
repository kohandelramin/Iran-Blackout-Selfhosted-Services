# Owncast

I use Owncast as a personal streaming service when Twitch or YouTube Live are not practical.

## Start

```bash
mkdir -p data
docker compose up -d
```

Open admin panel:

```text
http://SERVER_IP:8089/admin
```

## OBS settings

Server:

```text
rtmp://stream.example.ir/live
```

Stream key:

```text
YOUR_OWNCAST_STREAM_KEY
```

## Ports

- `8089/tcp` for web UI through reverse proxy
- `1935/tcp` for RTMP input from OBS

## Iran situation notes

Owncast is useful but it is not magic. If viewers are on weak mobile internet, reduce OBS output bitrate first. I usually test low settings before the real stream:

- 720p, 30 FPS
- 1500 to 2500 Kbps video bitrate
- 128 Kbps audio bitrate
