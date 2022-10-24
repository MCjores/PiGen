#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/home/pi/UDAS01"
mkdir -p "${ROOTFS_DIR}/home/pi/distribs"

install -m 755 -C            files/UDAS-01 "${ROOTFS_DIR}/home/pi/UDAS01/UDAS-01"
install -m 755 -C            files/amplituda-udas01_1.1.0_linux-arm.deb "${ROOTFS_DIR}/home/pi/distribs/amplituda-udas01_1.1.0_linux-arm.deb"
install -m 755 -C            files/udas01.service "${ROOTFS_DIR}/etc/systemd/system/udas01.service"

on_chroot << EOF
dpkg -i /home/pi/distribs/amplituda-udas01_1.1.0_linux-arm.deb
systemctl enable udas01.service
EOF

echo "while true; do ( ~/UDAS01/UDAS-01 -F; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
