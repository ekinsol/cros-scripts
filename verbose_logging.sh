#!/bin/bash

# Run this script on a Chromebook:
# 1. Put Chromebook in developer mode - https://www.chromium.org/chromium-os/poking-around-your-chrome-os-device
# 2. Log into device. Press CTRL+ALT+T to open crosh shell.
# 3. Type "shell" to enter Bash shell.
# 4. Type:
#      bash <(curl -s -S -L https://raw.githubusercontent.com/jay0lee/cros-scripts/master/verbose_logging.sh)

# Make SSD read/write if it's not
sudo touch /root-is-readwrite &> /dev/null
if [ ! -f /root-is-readwrite ]
then
  echo "Making root filesystem read/write..."
  echo
  bash <(curl -s -S -L https://raw.githubusercontent.com/jay0lee/cros-scripts/master/enable_rw_ssd.sh)
else
  echo "Root filesystem is already read/write"
fi

echo "--log-net-log=/tmp/netlog" >> /etc/chrome_dev.conf
echo "--net-log-level=0" >> /etc/chrome_dev.conf
echo "--v=2" >> /etc/chrome_dev.conf
echo
echo "Enabled verbose logging in /etc/chrome_dev.conf. Please reboot for logging to take effect."