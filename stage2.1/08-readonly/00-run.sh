#!/bin/bash -e

# Удаление заглушки под часы
on_chroot << EOF
apt remove -y --purge fake-hwclock
EOF

# Отлючение файла подкачки и монтирование корневой файловой системы в режиме только на чтение
sed -i -z "s/\n/ noswap ro\n/" "${ROOTFS_DIR}/boot/cmdline.txt"

# Перемещение файла c настройками DNS на tmpfs
mv "${ROOTFS_DIR}/etc/resolv.conf" "${ROOTFS_DIR}/tmp/dhcpcd.resolv.conf"
ln -s "/tmp/dhcpcd.resolv.conf" "${ROOTFS_DIR}/etc/resolv.conf"

# Размещение файла настройки аппаратных часов
touch "${ROOTFS_DIR}/tmp/adjtime"
ln -s "/tmp/adjtime" "${ROOTFS_DIR}/etc/adjtime"

# Перемещение зерна для генератора псевдослучайных чисел
rm "${ROOTFS_DIR}/var/lib/systemd/random-seed" && \
ln -s "/tmp/random-seed" "${ROOTFS_DIR}/var/lib/systemd/random-seed"
install -m 644 files/systemd-random-seed.service "${ROOTFS_DIR}/lib/systemd/system/"

# Создание директории для файлов sudo time stamp
install -d "${ROOTFS_DIR}/var/lib/sudo/ts"

# Создание директории для настроек звука
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/alsa"
ln -s "/home/${FIRST_USER_NAME}/.config/alsa" "${ROOTFS_DIR}/var/lib/alsa"

# Изменение таблицы разделов
sed -i "/boot/ s/defaults/defaults,ro/g" "${ROOTFS_DIR}/etc/fstab"
sed -i "/ext4/ s/defaults/defaults,ro/g" "${ROOTFS_DIR}/etc/fstab"
echo "
tmpfs    /tmp             tmpfs   nosuid,nodev                  0       0
tmpfs    /var/log         tmpfs   nosuid,nodev                  0       0
tmpfs    /var/log/apache2 tmpfs   nosuid,nodev                  0       0
tmpfs    /var/tmp         tmpfs   nosuid,nodev                  0       0
tmpfs    /var/lib/misc    tmpfs   nosuid,nodev                  0       0
tmpfs    /var/lib/dhcpcd5 tmpfs   nosuid,nodev                  0       0
tmpfs    /var/lib/sudo/ts tmpfs   nosuid,nodev                  0       0
tmpfs    /var/spool/cups  tmpfs   nosuid,nodev                  0       0" >> "${ROOTFS_DIR}/etc/fstab"

# Добавление команд переключения режимов доступа к файловой системе в bashrc
cat files/bash.bashrc.addon.sh >> "${ROOTFS_DIR}/etc/bash.bashrc"

# Установка службы первичной настройки
install -m 755 files/configure-once/configure_once.sh "${ROOTFS_DIR}/usr/lib/"
install -m 644 files/configure-once/configure-once.service "${ROOTFS_DIR}/etc/systemd/system/"

# Установка службы выхода из первичной настройки
install -m 755 files/reboot-once/reboot_once.sh "${ROOTFS_DIR}/usr/lib/"
install -m 644 files/reboot-once/reboot-once.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
systemctl enable configure-once
systemctl enable reboot-once
EOF