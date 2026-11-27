# measure-internet

> A Bash script that measures your internet download speed, upload speed, ping, and web response time in one run.

[English](#english) | [العربية](#arabic)

![Bash](https://img.shields.io/badge/shell-bash-4EAA25?logo=gnubash&logoColor=white)
![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue)

---

<a id="english"></a>

## English

### Overview

`internet_speed_test.sh` checks the quality of your internet connection and prints a short summary:

- **Download and upload speed** — from a single `speedtest-cli --simple` run.
- **Ping time** — the average of 10 pings to `google.com`.
- **Response time** — the total time `curl` takes to fetch `https://www.google.com`.

### Features

- Checks that `speedtest-cli`, `curl`, and `ping` are installed before starting, and exits with a clear message if one is missing.
- Measures download and upload in one speed test.
- Exits with an error message if `speedtest-cli` fails.
- Colored progress messages and results (via `tput`).

### Requirements

- Bash
- [`speedtest-cli`](https://github.com/sivel/speedtest-cli)
- `curl`
- `ping`

For example, on Debian/Ubuntu:

```bash
sudo apt install speedtest-cli curl iputils-ping
# or install speedtest-cli with pip
pip install speedtest-cli
```

### Installation

```bash
git clone https://github.com/fahad4x4/measure-internet.git
cd measure-internet
chmod +x internet_speed_test.sh
```

### Usage

```bash
./internet_speed_test.sh
```

Output format (values depend on your connection):

```text
Measuring download and upload speed...
Measuring ping time...
Measuring response time...
Results:
Download speed: <value> Mbit/s
Upload speed: <value> Mbit/s
Ping time to google.com: <value> ms
Response time for https://www.google.com: <value> s
```

A full run takes a little while, since it includes a speed test and 10 pings.

### Project structure

```text
measure-internet/
├── internet_speed_test.sh   # the measurement script
├── LICENSE                  # Apache License 2.0
└── README.md
```

### License

Released under the Apache License 2.0. See [LICENSE](LICENSE).

### Author

**Fahad ALGhathbar** — GitHub: [@fahad4x4](https://github.com/fahad4x4)

---

<a id="arabic"></a>

<div dir="rtl">

## العربية

### نظرة عامة

يقيس السكربت `internet_speed_test.sh` جودة اتصالك بالإنترنت ويعرض ملخصًا مختصرًا يشمل:

- **سرعة التنزيل والرفع** — من تشغيل واحد للأمر `speedtest-cli --simple`.
- **زمن الاستجابة (Ping)** — متوسط 10 طلبات ping إلى `google.com`.
- **زمن استجابة الويب** — الوقت الكلي الذي يستغرقه `curl` لجلب `https://www.google.com`.

### المزايا

- التحقق من تثبيت `speedtest-cli` و`curl` و`ping` قبل البدء، والخروج برسالة واضحة إذا كانت إحداها غير مثبتة.
- قياس سرعتي التنزيل والرفع في اختبار سرعة واحد.
- الخروج برسالة خطأ إذا فشل `speedtest-cli`.
- رسائل تقدّم ونتائج ملونة (عبر `tput`).

### المتطلبات

- Bash
- [`speedtest-cli`](https://github.com/sivel/speedtest-cli)
- `curl`
- `ping`

على سبيل المثال، في Debian أو Ubuntu:

```bash
sudo apt install speedtest-cli curl iputils-ping
# أو تثبيت speedtest-cli عبر pip
pip install speedtest-cli
```

### التثبيت

```bash
git clone https://github.com/fahad4x4/measure-internet.git
cd measure-internet
chmod +x internet_speed_test.sh
```

### طريقة الاستخدام

```bash
./internet_speed_test.sh
```

شكل المخرجات (تختلف القيم بحسب اتصالك):

```text
Measuring download and upload speed...
Measuring ping time...
Measuring response time...
Results:
Download speed: <value> Mbit/s
Upload speed: <value> Mbit/s
Ping time to google.com: <value> ms
Response time for https://www.google.com: <value> s
```

يستغرق التشغيل الكامل بعض الوقت، لأنه يتضمن اختبار سرعة و10 طلبات ping.

### هيكل المشروع

```text
measure-internet/
├── internet_speed_test.sh   # سكربت القياس
├── LICENSE                  # رخصة Apache 2.0
└── README.md
```

### الرخصة

المشروع منشور بموجب رخصة Apache الإصدار 2.0. راجع ملف [LICENSE](LICENSE).

### المؤلف

**فهد الغثبر** — حساب GitHub: [@fahad4x4](https://github.com/fahad4x4)

</div>
