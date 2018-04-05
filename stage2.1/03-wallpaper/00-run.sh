#!/bin/bash -e

install -d "${ROOTFS_DIR}/usr/share/amplituda"
install -m 644 files/wallpaper.png "${ROOTFS_DIR}/usr/share/amplituda/wallpaper.png"

echo "feh --bg-fill /usr/share/amplituda/wallpaper.png &" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
