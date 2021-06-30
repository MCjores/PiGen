#!/bin/bash -e

install -d				                "${ROOTFS_DIR}/etc/systemd/system/systemd-udevd.service.d"
install -m 644 files/00-usbmount.conf	"${ROOTFS_DIR}/etc/systemd/system/systemd-udevd.service.d"