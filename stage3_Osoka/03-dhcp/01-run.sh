#!/bin/bash -e

install -m 644 files/dhcpcd.conf "${ROOTFS_DIR}/etc/"
install -m 644 files/dnsmasq.conf "${ROOTFS_DIR}/etc/"
