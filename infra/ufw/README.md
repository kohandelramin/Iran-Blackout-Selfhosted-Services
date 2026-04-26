# UFW firewall

This is the basic firewall profile I use before adding service specific rules.

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

Service ports:

```bash
# Jitsi media
sudo ufw allow 10000/udp

# TeamSpeak
sudo ufw allow 9987/udp
sudo ufw allow 10011/tcp
sudo ufw allow 30033/tcp

# Owncast RTMP
sudo ufw allow 1935/tcp
```

Enable:

```bash
sudo ufw enable
sudo ufw status verbose
```

If a service is behind Nginx only, do not expose its internal port publicly unless you really need it.
