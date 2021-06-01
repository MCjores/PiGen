#!/bin/bash -e

if [ ! -d "${ROOTFS_DIR}" ]; then
	PREV_ROOTFS_DIR="${WORK_DIR}/stage2.4/rootfs"
	copy_previous
fi
