#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
max_usb_current=1
hdmi_force_hotplug=1
hdmi_group=2
hdmi_mode=87
hdmi_cvt 1280 800 60 6 0 0 0
hdmi_drive=1
dtoverlay=vc4-fkms-v3d

EOF

echo "xrandr -o left" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"