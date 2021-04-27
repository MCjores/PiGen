#!/bin/bash

echo "Step tochscreen calibration"

touchscreen

if [ -e ~/99-calibration.conf ]
then
    exit 0
else
    exit 1
fi

