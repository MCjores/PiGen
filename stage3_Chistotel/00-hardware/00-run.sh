#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
dtoverlay=i2c-rtc,ds3231
enable_uart=1
EOF

on_chroot << EOF
apt-get -y remove fake-hwclock
update-rc.d -f fake-hwclock remove
systemctl disable fake-hwclock

su pi
. <(dbus-launch --sh-syntax)
timedatectl set-ntp false
kill "\$DBUS_SESSION_BUS_PID"
EOF