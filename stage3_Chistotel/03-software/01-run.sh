#!/bin/bash -e

echo "while true; do celandine /FullScreen; sleep 1; done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
