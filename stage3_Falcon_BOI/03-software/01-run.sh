#!/bin/bash -e

install -m 755 -C          files/* "${ROOTFS_DIR}/home/pi/"

on_chroot << EOF
dpkg -i /home/pi/amplituda-falconboi_1.2.2_linux-arm.deb
EOF

echo "while true; do ( cd /usr/lib/amplituda-falconboi/linux-arm &&  ./Amplituda.Falcon.BOI /FullScreen; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"