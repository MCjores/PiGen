#!/bin/sh
plymouth message --text="Подготовка системы к первому использованию..."
mount -o remount,rw /
systemctl disable configure-once