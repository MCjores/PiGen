#!/bin/bash -e

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/Celandine"
install -v -o 1000 -g 1000 -m 644 files/config/* "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/Celandine/"
install -v -o 1 -g 1 -m 644 files/celandine_ctr.spc "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"