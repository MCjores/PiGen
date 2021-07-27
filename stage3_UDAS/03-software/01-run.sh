#!/bin/bash -e

mkdir -p -v "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Amplituda/UDAS-03/References"

install -m 755 -C            files/UDAS-03 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/UDAS03/UDAS-03"
install -v -m 644 -d         files/References "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Amplituda/UDAS-03/References"
install -m 644 -C            files/*.json -t "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Amplituda/UDAS-03/"
install -m 755 -C            files/udas03.service "${ROOTFS_DIR}/etc/systemd/system/udas03.service"

echo "while true; do ( ~/UDAS03/UDAS-03 -F; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"

mkdir -p "${ROOTFS_DIR}/home/mariadb/mysql"
install -m 755 -C            files/mariadb/50-server.conf "${ROOTFS_DIR}/etc/mysql/mariadb.conf.d/50-server.cnf"
install -m 755 -C            files/mariadb/dontprotecthome.conf "${ROOTFS_DIR}/etc/systemd/system/mariadb.service.d/dontprotecthome.conf"
