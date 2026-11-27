#!/bin/bash
# Speedtest script by Fahad ALGhathbar

# Set colors
green=$(tput setaf 2 2>/dev/null)
red=$(tput setaf 1 2>/dev/null)
reset=$(tput sgr0 2>/dev/null)

# Check required tools
for tool in speedtest-cli curl ping; do
  if ! command -v "$tool" > /dev/null 2>&1; then
    echo "${red}$tool is not installed${reset}"
    exit 1
  fi
done

# Measure download and upload speed with one speedtest run
echo "${green}Measuring download and upload speed...${reset}"
if ! result=$(speedtest-cli --simple 2>&1); then
  echo "${red}speedtest-cli failed:${reset} $result"
  exit 1
fi
download_speed=$(awk '/Download/{print $2 " " $3}' <<< "$result")
upload_speed=$(awk '/Upload/{print $2 " " $3}' <<< "$result")

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
