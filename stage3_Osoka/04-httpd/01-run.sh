#!/bin/bash -e

install -m 644 files/allow-home.conf "${ROOTFS_DIR}/etc/apache2/conf-available"
install -m 644 files/010-osoka.conf "${ROOTFS_DIR}/etc/apache2/sites-available"

on_chroot << EOF
a2enconf allow-home.conf
a2dissite 000-default.conf
a2ensite 010-osoka.conf
EOF
