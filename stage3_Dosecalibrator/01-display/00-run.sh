#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
max_usb_current=1
hdmi_group=2
hdmi_mode=87
hdmi_cvt=800 480 60 6 0 0 0
EOF
