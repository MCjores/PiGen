#!/bin/bash -e

if [ ! -d "${ROOTFS_DIR}" ]; then
	echo "workdir = ${WORK_DIR}"
	PREV_ROOTFS_DIR="${WORK_DIR}/stage2.1_NoGraph/rootfs"
	copy_previous
fi
