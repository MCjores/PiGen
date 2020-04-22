#!/bin/bash -e

sed -i -z "s/\n/ usbhid.mousepoll=0\n/" "${ROOTFS_DIR}/boot/cmdline.txt"
sed -i "s/console=serial0,[0-9]* //" "${ROOTFS_DIR}/boot/cmdline.txt"
install -m 644 files/asound.conf "${ROOTFS_DIR}/etc/"
install -m 644 files/99-hidraw.rules "${ROOTFS_DIR}/etc/udev/rules.d/"

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
dtoverlay=i2c-rtc,ds3231
enable_uart=1
EOF

on_chroot << EOF
su pi
. <(dbus-launch --sh-syntax)
timedatectl set-ntp false
kill "\$DBUS_SESSION_BUS_PID"
EOF

on_chroot << EOF
apt-get clean
apt-get install -y --download-only $(cat files/packages)
cp /var/cache/apt/archives/*.deb /usr/lib/install-once/packages/

systemctl enable install-once
EOF