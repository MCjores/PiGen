#!/bin/bash -e

echo "ROOTFS_DIR = ${ROOTFS_DIR}"

#mkdir -p "${ROOTFS_DIR}/home/pi/UDAS03"
mkdir -p "${ROOTFS_DIR}/home/pi/distribs"

#install -m 755 -C            files/UDAS-03 "${ROOTFS_DIR}/home/pi/UDAS03/UDAS-03"
install -m 755 -C            files/bodudas_1.0.0_arm.deb "${ROOTFS_DIR}/home/pi/distribs/bodudas_1.0.0_arm.deb"
install -m 755 -C            files/bodudas.service "${ROOTFS_DIR}/etc/systemd/system/bodudas.service"

echo "installing service and .deb package..."

on_chroot << EOF
echo "Start EOF"
dpkg -i /home/pi/distribs/bodudas_1.0.0_arm.deb
systemctl enable bodudas.service
EOF
echo " service and .deb package installed"

#echo "while true; do ( ~/UDAS03/UDAS-03 -F; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
