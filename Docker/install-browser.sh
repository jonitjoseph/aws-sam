#!/usr/bin/bash

echo "Starting Downloading Chrome version"
mkdir -p "/opt/chrome"
curl -Lo "/opt/chrome/chrome-linux.zip" "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F929514%2Fchrome-linux.zip?alt=media"
unzip -q "/opt/chrome/chrome-linux.zip" -d "/opt/chrome/"
mv /opt/chrome/chrome-linux/* /opt/chrome/
rm -rf /opt/chrome/chrome-linux "/opt/chrome/chrome-linux.zip"
echo "Completed Downloading Chrome version"

echo "Starting Downloading Chromedriver version 96.0.4664.45"
mkdir -p "/opt/chromedriver/96.0.4664.45"
curl -Lo "/opt/chromedriver/96.0.4664.45/chromedriver_linux64.zip" "https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_linux64.zip"
# curl -Lo "/opt/chromedriver/96.0.4664.45/chromedriver_linux64.zip" "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F929514%2Fchromedriver_linux64.zip?alt=media"
unzip -q "/opt/chromedriver/96.0.4664.45/chromedriver_linux64.zip" -d "/opt/chromedriver/96.0.4664.45/"
chmod +x "/opt/chromedriver/96.0.4664.45/chromedriver"
rm -rf "/opt/chromedriver/96.0.4664.45/chromedriver_linux64.zip"
echo "Completed Downloading Chromedriver version 96.0.4664.45"
