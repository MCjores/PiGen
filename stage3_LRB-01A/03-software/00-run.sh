#!/bin/bash -e

install -d "${ROOTFS_DIR}/usr/local/lib/amplituda-lrb01a/"
install -m 644 files/* "${ROOTFS_DIR}/usr/local/lib/amplituda-lrb01a/"
install -m 755 files/Amplituda.GTK.LRB01A "${ROOTFS_DIR}/usr/local/lib/amplituda-lrb01a/Amplituda.GTK.LRB01A"

echo "while true; do /usr/local/lib/amplituda-lrb01a/Amplituda.GTK.LRB01A; sleep 1; done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
