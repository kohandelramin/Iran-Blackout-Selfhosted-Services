# Mattermost

I use Mattermost as a private chatroom when Telegram or Discord style tools are not reliable.

## Start

```bash
mkdir -p postgres mattermost/{config,data,logs,plugins,client-plugins,bleve-indexes}
docker compose up -d
```

Open:

```text
http://SERVER_IP:8065
```

Then put it behind Nginx as:

```text
https://chat.example.ir
```

## Notes from my setup

- Keep file uploads inside Docker volumes or mounted folders.
- For small groups, PostgreSQL with one Mattermost container is enough.
- Configure SMTP later if you need email invites or password reset.
- During internet restrictions, keep the Android APK or desktop installer available locally for your group.
