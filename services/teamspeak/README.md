# TeamSpeak 3

I use TeamSpeak 3 as a simple low latency Discord voice alternative. This repo is for the classic TeamSpeak 3 server, not the newer TeamSpeak 6 beta server.

## Start

```bash
mkdir -p data
docker compose up -d
```

Watch the logs on first run. TeamSpeak 3 prints the first admin privilege key once:

```bash
docker logs -f teamspeak
```

Save that key in KeePass or another password manager.

## Ports

- `9987/udp` voice server
- `10011/tcp` ServerQuery
- `30033/tcp` file transfer

## Connect

```text
voice.example.ir:9987
```

## Notes

For blackout use, TeamSpeak 3 can be more stable than browser based voice chat because the client is lighter and the protocol is focused on voice.

## Version note

This Compose file uses the official `teamspeak` Docker image and accepts the TeamSpeak 3 server license with `TS3SERVER_LICENSE=accept`.
