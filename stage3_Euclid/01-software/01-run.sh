#!/bin/bash -e

install -m 755 -C            files/euclid.service "${ROOTFS_DIR}/etc/systemd/system/euclid.service"
