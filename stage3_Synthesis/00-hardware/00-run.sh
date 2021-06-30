#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
dtoverlay=i2c-rtc,ds3231
enable_uart=1
EOF