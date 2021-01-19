#!/bin/bash -e

unzip files/Dosecal.zip -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}"
chown -R 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Dosecal"

echo "while true; do mono /home/${FIRST_USER_NAME}/Dosecal/Amplituda.RaspberryPi.Dosecalibrator.exe; sleep 1; done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
