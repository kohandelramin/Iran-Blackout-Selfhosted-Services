# FileBrowser

I use FileBrowser when I need a simple file sharing panel on my own server instead of uploading files to random paid websites.

## Start

```bash
mkdir -p data database config
docker compose up -d
```

Open:

```text
http://SERVER_IP:8088
```

Default login is usually `admin/admin`. Change it immediately.

## Reverse proxy idea

Use `files.example.ir` and proxy to `127.0.0.1:8088`.

## Notes from my setup

- I keep uploaded files in `./data`.
- I keep FileBrowser DB in `./database`.
- Do not put private files in a public repo.
- If you share files during internet restrictions, test download speed from a different ISP.
