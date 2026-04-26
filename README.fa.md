# سرویس‌های سلف هاست برای شرایط قطعی و اختلال اینترنت ایران

این ریپازیتوری بر اساس تجربه خودم برای راه‌اندازی چند سرویس Docker basedروی سرور لینوکسی داخل ایران نوشته شده، مخصوصا برای زمانی که اینترنت بین‌الملل ناپایدار می‌شود یا بعضی سرویس‌های خارجی از دسترس خارج می‌شوند.

English: [README.md](README.md)

## چرا این ریپازیتوری را ساختم
وقتی اینترنت به هم می‌ریزد، اولین چیزهایی که برای یک گروه کوچک از کار می‌افتند معمولا ارتباط، فایل شیرینگ، جلسه آنلاین، چت صوتی و استریم هستند. هدف من این بود یک جای مشخص داشته باشم که تنظیمات عملی و تجربه‌های خودم را نگه دارم.
این ریپازیتوری قرار نیست یک راهکار خیلی تمیز سازمانی باشد. بیشتر شبیه دفترچه تجربه است: چیزهایی که نصب کردم، تست کردم، خراب شد، درستش کردم و در نهایت به درد خورد.
## سرویس‌ها
| سرویس | استفاده من | جایگزین برای |
| --- | --- | --- |
| Jitsi | جلسه آنلاین و تست استریم بازی | Google Meet |
| TeamSpeak 3 | چت صوتی کم تاخیر | Discord Voice |
| Mattermost | چت روم خصوصی برای گروه کوچک | Telegram, Slack, Discord Text |
| Owncast | استریم شخصی | Twitch, YouTube Live |
| FileBrowser | فایل شیرینگ روی سرور خودم | سایت‌های پولی فایل شیرینگ |
## فرض‌های اصلی سرور
معمولا این مدل را در نظر گرفتم:
- Ubuntu 24.04
- Docker و Docker Compose
- Nginx reverse proxy روی خود سرور
- ArvanCloud برای DNS و در بعضی سرویس‌ها CDN
- UFW firewall
- دامنه ارزان `.ir` از IRNIC یا نماینده‌ها
- بدون ذخیره کردن رمز و توکن داخل Git
اگر این ریپازیتوری را عمومی می‌کنی، هیچ وقت پسورد واقعی، private key، توکن ادمین، یا IP واقعی سرورت را داخلش نگذار.
## ساختار ریپازیتوری
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
└── README.md
```
## شروع سریع
```bash
git clone https://github.com/kohandelramin/Iran-Blackout-Selfhosted-Services.git
cd iran-blackout-selfhosted-services
cp .env.example .env
nano .env
```
آماده‌سازی سرور:
```bash
sudo bash scripts/00-host-bootstrap.sh
sudo bash scripts/01-disable-ipv6.sh
sudo bash scripts/02-ufw-basic.sh
```
اجرای یک سرویس:
```bash
cd services/filebrowser
docker compose up -d
```
## ساختار پیشنهادی دامنه
```bash
meet.example.ir       Jitsi
voice.example.ir      TeamSpeak 3
chat.example.ir       Mattermost
stream.example.ir     Owncast
files.example.ir      FileBrowser
```
در ArvanCloud برای هر ساب‌دامین یک رکورد `A` بساز و آن را به IPv4 سرور وصل کن.
## نکته‌های مهم برای شرایط اختلال
- قبل از بدتر شدن وضعیت اینترنت، Docker image ها را pull کن.
- از compose و `.env` بکاپ محلی داشته باش.
- برای Docker، apt، pip و npm از میرورهای داخلی استفاده کن.
- DNSها را تست کن. هیچ DNSای همیشه برای همه بهترین نیست.
- اگر Docker یا شبکه سرور رفتار عجیب دارد، IPv6 را غیرفعال کن و دوباره تست بگیر.
- برای Jitsi، پورت UDP 10000 خیلی مهم است.
- برای TeamSpeak 3، پورت UDP 9987 را باز کن.
- برای Owncast، قبل از نیاز واقعی با OBS تست بگیر.
## لینک‌های رسمی پروژه‌ها
- Jitsi Docker: https://github.com/jitsi/docker-jitsi-meet
- TeamSpeak Docker image: https://hub.docker.com/_/teamspeak
- TeamSpeak 3 server Docker image: https://hub.docker.com/_/teamspeak
- Mattermost Docker: https://github.com/mattermost/docker
- Owncast: https://owncast.online
- FileBrowser: https://filebrowser.org
## منابع مفید ایرانی
- مخازن لینوکس آروان: https://www.arvancloud.ir/fa/dev/linux-repository
- مجموعه مخازن داخلی: https://0xv.ir/dev/
- مقاله راهنمای میرورها: https://virgool.io/@amirreza.sedighi/راهنمای-جامع-استفاده-از-میرورها-برای-توسعه-دهندگان-ایرانی-sw2tzkj1ua4l
- ایرنیک: https://www.nic.ir
## نکته برای ویندوز
می‌شود با Docker Desktop و WSL2 روی ویندوز هم بعضی سرویس‌ها را اجرا کرد، ولی من برای سرور عمومی پیشنهادش نمی‌کنم. برای اینکه دامنه از اینترنت باز شود هنوز یکی از این‌ها را لازم داری:
1. VPS با IP ثابت عمومی.
2. اینترنت خانه یا شرکت با IP ثابت عمومی و port forwarding روی مودم.
3. Dynamic DNS برای IP متغیر، ولی پایداری‌اش کمتر است.
برای شرایط اختلال اینترنت ایران، یک VPS لینوکسی داخل ایران معمولا خیلی راحت‌تر از یک سیستم ویندوزی پشت مودم خانگی قابل مدیریت است.
## هشدار امنیتی
این ریپازیتوری برای سلف هاست عملی است، نه تضمین حریم خصوصی یا ناشناس بودن. ISP، شرکت هاستینگ، DNS provider، CDN provider و لاگ‌های سرور همچنان می‌توانند متادیتا را ببینند. برای کارهایی که ممکن است برای آدم‌ها خطر ایجاد کند از این راهکار استفاده نکن.
