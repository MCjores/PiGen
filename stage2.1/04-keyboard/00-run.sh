#!/bin/bash -e

echo "onboard &" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"

on_chroot << EOF
su pi
. <(dbus-launch --sh-syntax)

gsettings set org.onboard system-theme-tracking-enabled false
gsettings set org.onboard layout "/usr/share/onboard/layouts/Phone.onboard"
gsettings set org.onboard theme "/usr/share/onboard/themes/Nightshade.theme"

gsettings set org.onboard.auto-show enabled true
gsettings set org.onboard.window docking-enabled true

gsettings set org.gnome.desktop.interface toolkit-accessibility true

kill "\$DBUS_SESSION_BUS_PID"
EOF
