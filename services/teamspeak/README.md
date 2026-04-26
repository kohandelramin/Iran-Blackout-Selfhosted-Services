# TeamSpeak

I use TeamSpeak as a simple low latency Discord voice alternative.

## Start

```bash
mkdir -p data
docker compose up -d
```

Watch the logs on first run. TeamSpeak prints the first admin privilege key once:

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

For blackout use, TeamSpeak can be more stable than browser based voice chat because the client is lighter and the protocol is focused on voice.
