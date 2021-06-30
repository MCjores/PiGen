#!/bin/bash -e

install -m 755          files/touchscreen "${ROOTFS_DIR}/home/pi/"
install -v -D -o 1000 -g 1000 -m 755 files/xinput_calibrator --target-directory="${ROOTFS_DIR}/home/${FIRST_USER_NAME}/custom_calibrator/"

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
hdmi_force_hotplug=1
hdmi_group=2
hdmi_mode=11
EOF
