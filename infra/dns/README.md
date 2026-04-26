# DNS and domain setup

## Domain

For a cheap Iranian setup, I usually use a `.ir` domain.

Steps:

1. Create or use an IRNIC handle.
2. Register a domain directly or through a reseller.
3. Add the domain to ArvanCloud DNS.
4. Change nameservers in IRNIC to the nameservers ArvanCloud gives you.
5. Add `A` records for each service.

## Suggested records

| Type | Name | Value |
| --- | --- | --- |
| A | meet | SERVER_IPV4 |
| A | voice | SERVER_IPV4 |
| A | chat | SERVER_IPV4 |
| A | stream | SERVER_IPV4 |
| A | files | SERVER_IPV4 |

## CDN proxy mode warning

For normal web services like Mattermost, FileBrowser, and Owncast web UI, CDN proxy can be useful.

For Jitsi and TeamSpeak, be careful:

- Jitsi media needs UDP 10000.
- TeamSpeak voice uses UDP 9987.
- Normal CDN HTTP proxy will not proxy these UDP flows like a web page.

So DNS can point to the server, but voice and media ports must reach the server directly.

## DNS resolvers to test

Try these only after checking what works with your ISP:

```text
Shecan: 178.22.122.100, 185.51.200.2
403: 10.202.10.202, 10.202.10.102
Radar: 10.202.10.10, 10.202.10.11
Pishgaman: 5.202.100.100, 5.202.100.101
Shatel: 85.15.1.14, 85.15.1.15
```
