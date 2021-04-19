#!/bin/bash

echo "Step 01"
~/calibrate.sh

if [ -e ~/99-calibration.conf ]
then
    exit 0
else
    exit 1
fi

