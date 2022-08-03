#!/bin/bash -e

install -m 644 files/99-hidraw.rules "${ROOTFS_DIR}/etc/udev/rules.d/99-hidraw.rules"
