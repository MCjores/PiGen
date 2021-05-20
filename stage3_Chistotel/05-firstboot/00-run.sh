#!/bin/bash -e

install -m 755          files/firstboot "${ROOTFS_DIR}/usr/sbin/"

install -v -D -o 1000 -g 1000 files/00-step.sh --target-directory="${ROOTFS_DIR}/home/${FIRST_USER_NAME}/configurator/steps/"
