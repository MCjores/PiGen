#!/bin/bash -e

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/pi/.config"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/pi/.config/openbox"
touch "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
chown 1000:1000 "${ROOTFS_DIR}/home/pi/.config/openbox/autostart" -v
chmod +x "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"

echo "setxkbmap -layout us,ru -variant -option grp:lwin_toggle &" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"