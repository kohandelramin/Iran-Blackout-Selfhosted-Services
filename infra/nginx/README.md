# Nginx reverse proxy

I usually keep Docker services on local ports and expose only Nginx to the public web.

Example local ports:

| Service | Local port |
| --- | --- |
| FileBrowser | 8088 |
| Mattermost | 8065 |
| Owncast | 8089 |
| Jitsi web | 8000 or 8443 |

Copy example config:

```bash
sudo cp infra/nginx/example-services.conf /etc/nginx/sites-available/selfhosted-services.conf
sudo ln -s /etc/nginx/sites-available/selfhosted-services.conf /etc/nginx/sites-enabled/selfhosted-services.conf
sudo nginx -t
sudo systemctl reload nginx
```

For SSL, either use ArvanCloud edge SSL or install certbot on the server. Do not mix too many redirect rules at first. First make HTTP work, then add HTTPS.
