#!/bin/bash -e

install -m 755          files/firstboot "${ROOTFS_DIR}/usr/sbin/"
install -m 755          files/firstboot.service "${ROOTFS_DIR}/etc/systemd/system/"

install -v -o 1000 -g 1000 files/configurate.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"

mkdir "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/configurator"
mkdir "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/configurator/steps"
mkdir "${ROOTFS_DIR}/var/lib/dosecalibrator"
touch "${ROOTFS_DIR}/var/lib/dosecalibrator/firstboot"
systemctl enable firstboot.service

install -v -o 1000 -g 1000 files/01-run.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/configurator/steps/"

sed -i '1s/^/~\/configurate.sh \n/' "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"