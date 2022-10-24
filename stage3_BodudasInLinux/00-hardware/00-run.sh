#!/bin/bash -e
echo "ROOTFS_DIR = ${ROOTFS_DIR}"

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
dtoverlay=disable-bt
dtoverlay=i2c-rtc,ds3231
enable_uart=1
EOF

echo "bluetooth disabled"

sed -i "s/console=serial0,[0-9]* //" "${ROOTFS_DIR}/boot/cmdline.txt"

echo  "deleted console serial..."

#on_chroot << EOF
#apt-get -y remove fake-hwclock
#update-rc.d -f fake-hwclock remove
#apt-get update
#EOF
