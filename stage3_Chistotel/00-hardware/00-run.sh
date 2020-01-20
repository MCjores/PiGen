#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
dtoverlay=i2c-rtc,ds3231
enable_uart=1
EOF

sed -i "s/console=serial0,[0-9]* //" "${ROOTFS_DIR}/boot/cmdline.txt"

on_chroot << EOF
su pi
. <(dbus-launch --sh-syntax)
timedatectl set-ntp false
kill "\$DBUS_SESSION_BUS_PID"
EOF