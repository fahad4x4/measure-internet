#!/bin/bash
# Speedtest script by Fahad ALGhathbar

# Set colors
green=$(tput setaf 2 2>/dev/null)
red=$(tput setaf 1 2>/dev/null)
reset=$(tput sgr0 2>/dev/null)

# Cloudflare's public speed test endpoints
download_url="https://speed.cloudflare.com/__down?bytes=25000000"   # 25 MB
upload_url="https://speed.cloudflare.com/__up"
upload_bytes=10000000                                               # 10 MB

# Check required tools
for tool in curl ping awk; do
  if ! command -v "$tool" > /dev/null 2>&1; then
    echo "${red}$tool is not installed${reset}"
    exit 1
  fi
done

# Convert bytes per second (curl's speed unit) to "<n> Mbit/s"
to_mbits() {
  awk -v bps="$1" 'BEGIN { printf "%.2f Mbit/s", bps * 8 / 1000000 }'
}

# Measure download speed
echo "${green}Measuring download speed...${reset}"
if ! download_bps=$(curl -sSf -o /dev/null --max-time 60 -w "%{speed_download}" "$download_url" 2>&1); then
  echo "${red}Download test failed:${reset} $download_bps"
  exit 1
fi
download_speed=$(to_mbits "$download_bps")

# Measure upload speed
echo "${green}Measuring upload speed...${reset}"
if ! upload_bps=$(head -c "$upload_bytes" /dev/zero | curl -sSf -o /dev/null --max-time 60 -w "%{speed_upload}" -X POST --data-binary @- "$upload_url" 2>&1); then
  echo "${red}Upload test failed:${reset} $upload_bps"
  exit 1
fi
upload_speed=$(to_mbits "$upload_bps")

# Measure ping time
echo "${green}Measuring ping time...${reset}"
ping_time=$(ping -c 10 google.com | tail -1 | awk '{print $4}' | cut -d '/' -f 2)

# Measure response time
echo "${green}Measuring response time...${reset}"
response_time=$(curl -s -o /dev/null -w "%{time_total}" https://www.google.com)

echo "${green}Results:${reset}"
echo "Download speed: ${green}$download_speed${reset}"
echo "Upload speed: ${green}$upload_speed${reset}"
echo "Ping time to google.com: ${green}$ping_time ms${reset}"
echo "Response time for https://www.google.com: ${green}$response_time s${reset}"
