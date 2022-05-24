#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Amplituda/UDAS-01/"

install -m 644 -C            files/*.json -t "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Amplituda/UDAS-01/"
install -m 755 -C            files/udas03.service "${ROOTFS_DIR}/etc/systemd/system/udas01.service"
chown -R 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Amplituda/"
chmod -R 777 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Amplituda/"

echo "while true; do ( /usr/bin/amplituda-udas01-gui/UDAS-01 -F; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"

mkdir -p "${ROOTFS_DIR}/home/mariadb/mysql"
install -m 755 -C            files/mariadb/50-server.cnf "${ROOTFS_DIR}/etc/mysql/mariadb.conf.d/50-server.cnf"
install -m 755 -C            files/mariadb/50-client.cnf "${ROOTFS_DIR}/etc/mysql/mariadb.conf.d/50-client.cnf"

mkdir -p "${ROOTFS_DIR}/etc/systemd/system/mariadb.service.d"
install -m 755 -C            files/mariadb/dontprotecthome.conf "${ROOTFS_DIR}/etc/systemd/system/mariadb.service.d/dontprotecthome.conf"


cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
framebuffer_width=832
framebuffer_height=480
EOF
