#!/bin/bash -e

install -m 755          files/firstboot "${ROOTFS_DIR}/usr/sbin/"
install -m 644          files/firstboot.service "${ROOTFS_DIR}/etc/systemd/system/"

install -v -o 1000 -g 1000 files/configurate.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"
install -v -D -m 777 -o 1000 -g 1000 files/00-step.sh --target-directory="${ROOTFS_DIR}/home/${FIRST_USER_NAME}/configurator/steps/"

sed -i '1s/^/~\/configurate.sh \& \n/' "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/openbox/autostart"

mkdir -p "${ROOTFS_DIR}/var/lib/dosecalibrator"
touch "${ROOTFS_DIR}/var/lib/dosecalibrator/firstboot"
on_chroot << EOF
systemctl enable firstboot.service
EOF
