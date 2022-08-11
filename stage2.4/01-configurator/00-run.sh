#!/bin/bash -e

install -v -o 1000 -g 1000 files/configurate.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"
mkdir -p "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/configurator/steps/"
chown -R 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/configurator/"

#sed -i '1s/^/~\/configurate.sh \& \n/' "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/openbox/autostart"

