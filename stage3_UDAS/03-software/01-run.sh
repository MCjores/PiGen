#!/bin/bash -e

on_chroot << EOF
dpkg -i /home/pi/amplituda-udas03_1.0.0_linux-arm.deb
EOF

install -m 755 -C -d          files/UDAS-03 "${ROOTFS_DIR}/home/pi/UDAS03"
install -m 755 -C             files/udas03.service "${ROOTFS_DIR}/etc/systemd/system"

echo "while true; do ( ~/UDAS03/UDAS-03 -F; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"