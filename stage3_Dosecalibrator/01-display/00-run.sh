#!/bin/bash -e

install -m 755          files/calibrate "${ROOTFS_DIR}/usr/sbin/"
install -o 1000 -g 1000 files/rc.xml    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/openbox/"

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
max_usb_current=1
hdmi_group=2
hdmi_mode=87
hdmi_cvt=800 480 60 6 0 0 0
EOF
