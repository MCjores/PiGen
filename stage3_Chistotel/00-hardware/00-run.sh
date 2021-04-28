#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
dtoverlay=i2c-rtc,ds3231
enable_uart=1
EOF

sed -i "s/console=serial0,[0-9]* //" "${ROOTFS_DIR}/boot/cmdline.txt"

on_chroot << EOF
apt-get -y remove fake-hwclock
update-rc.d -f fake-hwclock remove
apt-get update
EOF
