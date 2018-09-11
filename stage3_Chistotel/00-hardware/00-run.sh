#!/bin/bash -e

echo "dtoverlay=i2c-rtc,ds3231" >> "${ROOTFS_DIR}/boot/config.txt"

on_chroot << EOF
apt-get -y remove fake-hwclock
sudo update-rc.d -f fake-hwclock remove
systemctl disable fake-hwclock
EOF