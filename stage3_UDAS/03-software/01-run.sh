#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/home/pi/UDAS03"
mkdir -p "${ROOTFS_DIR}/home/pi/distribs"

install -m 755 -C            files/UDAS-03 "${ROOTFS_DIR}/home/pi/UDAS03/UDAS-03"
install -m 755 -C            files/amplituda-udas03_1.1.0_linux-arm.deb "${ROOTFS_DIR}/home/pi/distribs/amplituda-udas03_1.1.0_linux-arm.deb"
install -m 755 -C            files/udas03.service "${ROOTFS_DIR}/etc/systemd/system/udas03.service"

on_chroot << EOF
dpkg -i /home/pi/distribs/amplituda-udas03_1.1.0_linux-arm.deb
EOF

echo "while true; do ( ~/UDAS03/UDAS-03 -F; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
