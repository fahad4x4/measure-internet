#!/bin/bash
# Speedtest script by Fahad ALGhathbar

# Set colors
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)

# Check if wget is installed
if ! which wget > /dev/null; then
  echo "${red}wget is not installed${reset}"
  exit 1
fi

# Check if speedtest-cli is installed
if ! which speedtest-cli > /dev/null; then
  echo "${red}speedtest-cli is not installed${reset}"
  exit 1
fi

# Measure download speed
echo "${green}Measuring download speed...${reset}"
download_speed=$(wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip 2>&1 | grep -o '[0-9.]\+ [KM]*B/s' | tail -1)

# Measure upload speed
echo "${green}Measuring upload speed...${reset}"
upload_speed=$(speedtest-cli --simple | awk '/Upload/{print $2 " " $3}')

# Measure ping time
echo "${green}Measuring ping time...${reset}"
ping_time=$(ping -c 10 google.com | tail -1| awk '{print $4}' | cut -d '/' -f 2)

# Measure response time
echo "${green}Measuring response time...${reset}"
response_time=$(curl -s -o /dev/null -w "%{time_total}\n" https://www.google.com)

echo "${green}Results:${reset}"
echo "Download speed: ${green}$download_speed${reset}"
echo "Upload speed: ${green}$upload_speed${reset}"
echo "Ping time to google.com: ${green}$ping_time ms${reset}"
echo "Response time for https://www.google.com: ${green}$response_time s${reset}"
