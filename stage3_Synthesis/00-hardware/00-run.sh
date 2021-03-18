#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
dtoverlay=i2c-rtc,ds3231
enable_uart=1
dtparam=spi=on
dtoverlay=enc28j60
EOF

on_chroot << EOF
su pi
. <(dbus-launch --sh-syntax)
timedatectl set-ntp false
kill "\$DBUS_SESSION_BUS_PID"
EOF